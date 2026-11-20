import JapanTaxLaw.DisasterIncomeThreshold
import JapanTaxLaw.TaxFinance

/-!
# DisasterIncomeThresholdSpec — independent spec for art. 2(1) first band

The implementation uses a decidable `≤` comparison; the spec states the same
condition as the negation of the strict converse (`¬ threshold < income`).
The kernel proves their equivalence for ALL Nat inputs — not a finite sample.

Variable contract: `totalIncome : Money` = 合計所得金額 (所得税法 art. 22),
unit yen, domain Nat. The value itself is caller-established; this unit only
decides the ¥5,000,000 threshold.
-/

namespace JapanTaxLaw.DisasterIncomeThreshold

open JapanTaxLaw.TaxFinance

/-- 独立仕様: 合計所得金額が閾値を超えないこと. -/
def specFirstBand (totalIncome : Money) : Prop := ¬ threshold < totalIncome

/-- 対応・健全性: 実装と独立仕様が全ての入力で一致する (kernel-checked). -/
theorem agree_disaster_income_threshold (totalIncome : Money) :
    inFirstBand totalIncome = true ↔ specFirstBand totalIncome := by
  unfold inFirstBand specFirstBand
  simp [Nat.not_lt]

/-- 境界値: 閾値ちょうどは該当する. -/
theorem at_threshold : inFirstBand 5_000_000 = true := by decide

/-- 境界値: 閾値を一円超えると該当しない. -/
theorem just_above_threshold : inFirstBand 5_000_001 = false := by decide

/-- 単調性: 該当する額より小さい額も該当する. -/
theorem downward_closed (a b : Money) (hab : a ≤ b) (hb : inFirstBand b = true) :
    inFirstBand a = true := by
  have hb_le : b ≤ threshold := by simpa [inFirstBand] using hb
  exact Nat.le_trans hab hb_le

/-- 有限の確認は補助; 上の普遍定理が証明である. -/
def agreeDisasterIncomeThreshold : Bool :=
  [0, 1, 4_999_999, 5_000_000, 5_000_001, 10_000_000].all fun b =>
    inFirstBand b == (decide (b ≤ threshold))

example : agreeDisasterIncomeThreshold = true := by decide

end JapanTaxLaw.DisasterIncomeThreshold
