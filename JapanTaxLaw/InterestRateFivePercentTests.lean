import JapanTaxLaw.InterestRateFivePercentSpec

/-! Boundary tests for the 5% rate; every example is kernel-decided. -/
namespace JapanTaxLaw.InterestRateFivePercent

open JapanTaxLaw.TaxFinance

example : interestRate.den = 100 := by decide
example : TaxRate.numDen interestRate = (5, 100) := by decide

example : interestRate.applyFloor 0 = 0 := by decide
example : interestRate.applyFloor 1 = 0 := by decide
example : interestRate.applyFloor 20 = 1 := by decide
example : interestRate.applyFloor 100 = 5 := by decide
example : interestRate.applyFloor 1_000 = 50 := by decide

example : specAmount 0 = interestRate.applyFloor 0 := agree_spec_impl 0
example : specAmount 1 = interestRate.applyFloor 1 := agree_spec_impl 1
example : specAmount 20 = interestRate.applyFloor 20 := agree_spec_impl 20
example : specAmount 1_000 = interestRate.applyFloor 1_000 := agree_spec_impl 1_000

end JapanTaxLaw.InterestRateFivePercent
