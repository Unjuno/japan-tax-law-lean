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

end JapanTaxLaw.DisasterVictimIncomeLimit
