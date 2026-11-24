import JapanTaxLaw.InheritanceResidualPeriod10YearsSpec

/-
# InheritanceResidualPeriod10YearsTests — kernel-decided checks, 相続税法 第二十三条

Boundary categories: zero, small input, just-below, at (included), just-above.
-/

namespace JapanTaxLaw.InheritanceResidualPeriod10Years

open JapanTaxLaw.TaxFinance

example : periodCeilingYears = 10 := rfl
example : withinPeriod 0 := by
  unfold withinPeriod periodCeilingYears
  decide
example : withinPeriod 9 := by
  unfold withinPeriod periodCeilingYears
  decide
example : withinPeriod 10 := by
  unfold withinPeriod periodCeilingYears
  decide
example : ¬ withinPeriod 11 := by
  unfold withinPeriod periodCeilingYears
  decide
example : withinPeriodBool 0 = true := by decide
example : withinPeriodBool 1 = true := by decide
example : withinPeriodBool 9 = true := by decide
example : withinPeriodBool 10 = true := by decide
example : withinPeriodBool 11 = false := by decide
example (a : Nat) : withinPeriod a ↔ specWithinPeriod a := agree_within_period a

end JapanTaxLaw.InheritanceResidualPeriod10Years
