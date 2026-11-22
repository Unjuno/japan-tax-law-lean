import JapanTaxLaw.EligibleDependentAge70Spec

/-! Kernel-decided boundary examples for EligibleDependentAge70 (0/69/70/71 years). -/

namespace JapanTaxLaw.EligibleDependentAge70Tests

open JapanTaxLaw.EligibleDependentAge70
open JapanTaxLaw.EligibleDependentAge70Spec

example : isEligibleDependent 0 = false := by decide
example : isEligibleDependent 69 = false := by decide
example : isEligibleDependent 70 = true := by decide
example : isEligibleDependent 71 = true := by decide
example : specEligible 69 = false := by decide
example : specEligible 70 = true := by decide
example : specEligible 71 = true := by decide
example : agreeEligible 0 := agree_eligible 0
example : agreeEligible 69 := agree_eligible 69
example : agreeEligible 70 := agree_eligible 70
example : agreeEligible 71 := agree_eligible 71

end JapanTaxLaw.EligibleDependentAge70Tests
