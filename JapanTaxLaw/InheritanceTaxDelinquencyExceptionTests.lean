import JapanTaxLaw.InheritanceTaxDelinquencyExceptionSpec

/-!
# InheritanceTaxDelinquencyExceptionTests — kernel-checked checks for 相続税法 第三十八条(4)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceTaxDelinquencyException

open JapanTaxLaw.TaxFinance

example : maxDelinquencyYen = 1_000_000 := rfl
example : maxPeriodYears = 3 := rfl
example : exceptionApplies 1_000_000 3 := at_limit
example : ¬ exceptionApplies 1_000_001 3 := amount_above
example : ¬ exceptionApplies 1_000_000 4 := period_above
example : exceptionApplies 999_999 2 := both_below
example (y : Money) (p : Nat) : exceptionApplies y p ↔ specException y p := agree_exception y p
example : maxDelinquencyYen = 1_000_000 ∧ maxPeriodYears = 3 := constants_decoded

end JapanTaxLaw.InheritanceTaxDelinquencyException
