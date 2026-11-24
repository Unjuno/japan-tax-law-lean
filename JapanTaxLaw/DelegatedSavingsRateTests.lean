import JapanTaxLaw.DelegatedSavingsRateSpec

/-! Boundary tests for the delegated 7% rate; all kernel-checked. -/
namespace JapanTaxLaw.DelegatedSavingsRate

open JapanTaxLaw.TaxFinance

example : savingsRate.den = 100 := by decide
example : TaxRate.numDen savingsRate = (7, 100) := by decide

example : categoryAmount true 0 = 0 := by decide
example : categoryAmount true 1 = 0 := by decide
example : categoryAmount true 100 = 7 := by decide
example : categoryAmount true 1_000 = 70 := by decide
example : categoryAmount false 1_000 = 0 := by decide

example : specAmount true 100 = categoryAmount true 100 := agree_spec_impl true 100
example : specAmount false 100 = categoryAmount false 100 := agree_spec_impl false 100

end JapanTaxLaw.DelegatedSavingsRate
