import JapanTaxLaw.DisasterIncomeUpperBandSpec

/-! Boundary tests for art. 2(1) strict-exceedance band; all kernel-decided. -/
namespace JapanTaxLaw.DisasterIncomeUpperBand

example : upperThresholdYen = 7_500_000 := by decide

example : eligibleUpper 0 = false := by decide
example : eligibleUpper 7_499_999 = false := by decide
example : eligibleUpper 7_500_000 = false := by decide
example : eligibleUpper 7_500_001 = true := by decide
example : eligibleUpper 10_000_000 = true := by decide

example : specEligibleUpper 7_499_999 = false := by decide
example : specEligibleUpper 7_500_000 = false := by decide
example : specEligibleUpper 7_500_001 = true := by decide

example : specEligibleUpper 7_500_000 = eligibleUpper 7_500_000 := agree_spec_impl 7_500_000
example : specEligibleUpper 7_500_001 = eligibleUpper 7_500_001 := agree_spec_impl 7_500_001

end JapanTaxLaw.DisasterIncomeUpperBand
