import JapanTaxLaw.InterestSplitRate5Pct

/-
# InterestSplitRate5PctSpec — 第七十一条の六 第一款 の独立定式

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
Article Num 71_6 Paragraph 1, needle 「利子割の税率は、百分の五とする。」

Independent restatement: the levy is exactly five hundredths of the base;
we express it as the exact hundred-fold numerator `base × 5 / 100`. No
implementation identifier is reused in the definitions below; the agreement
theorems are separate bridges. No rounding is introduced: the clause states
none.
-/

namespace JapanTaxLaw.InterestSplitRate5Pct

/-- 独立定式: 百分の五 = 5/100 の分子。impl 識別子は使わない。 -/
def specRateNumerator : Nat := 5

/-- 独立定式: 百分の五 = 5/100 の分母。impl 識別子は使わない。 -/
def specRateDenominator : Nat := 100

/-- 独立定式: 正確な税額の百倍。丸めなし。 -/
def specHundredFold (base : Nat) : Nat :=
  base * specRateNumerator

theorem agreeNumerator : rateNumerator = specRateNumerator := by
  unfold rateNumerator specRateNumerator
  rfl

theorem agreeDenominator : rateDenominator = specRateDenominator := by
  unfold rateDenominator specRateDenominator
  rfl

theorem agreeAmount (base : Nat) :
    hundredFoldAmount base = specHundredFold base := by
  unfold hundredFoldAmount specHundredFold
  rw [agreeNumerator]

end JapanTaxLaw.InterestSplitRate5Pct
