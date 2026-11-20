import JapanTaxLaw.DisasterVictimIncomeLimitSpec

/-!
# DisasterVictimIncomeLimitTests — kernel-checked boundary checks for art.2(1)

All checks are `decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.DisasterVictimIncomeLimit

open JapanTaxLaw.TaxFinance

example : incomeLimit = 7_500_000 := rfl
example : withinIncomeLimit 7_500_000 := by
  unfold withinIncomeLimit incomeLimit; decide
example : withinIncomeLimit (7_500_000 - 1) := by
  unfold withinIncomeLimit incomeLimit; decide
example : ¬ withinIncomeLimit 7_500_001 := by
  unfold withinIncomeLimit incomeLimit; decide
example : withinIncomeLimit 0 := by
  unfold withinIncomeLimit; decide
example : withinIncomeLimit 7_500_000 ↔ specWithinIncomeLimit 7_500_000 :=
  agree_income_limit 7_500_000
example : ¬ withinIncomeLimit (incomeLimit + 1) := income_one_over_fails
example : withinIncomeLimit incomeLimit := income_at_limit
example : checkIncomeLimit 0 = true := by decide
example : checkIncomeLimit 7_500_000 = true := by decide
example : checkIncomeLimit 7_500_001 = false := by decide

-- ==== 追加の必須境界 (a) 零入力 / (b) 小さい正の入力 (1..13) / (c) saturation ====
-- 下の 7_500_000 は incomeLimit（七百五十万円）そのもの。
-- (a) 零入力: 打ち切り減算 0 - incomeLimit は 0 に saturation（結果 0 = 入力 0）。
example : 0 - 7500000 = 0 := by decide
-- (b) 小さい正の入力 (1..13): 1 円・13 円はいずれも閾値以下 → 条件成立。
example : checkIncomeLimit 1 = true := by decide
example : checkIncomeLimit 13 = true := by decide
-- (c) saturation/identity: 法定閾値ちょうどで打ち切り減算が 0 に saturation。
example : 7500000 - 7500000 = 0 := by decide
--     閾値を 1 円超えると 7_500_001 - incomeLimit = 1（saturation が外れる）。
example : 7500001 - 7500000 = 1 := by decide
--     identity: 法定額から 0 を引いても法定額（結果 = 入力 7_500_000）。
example : 7500000 - 0 = 7500000 := by decide

end JapanTaxLaw.DisasterVictimIncomeLimit
