import JapanTaxLaw.BatchPeriod96f2895de1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod96f2895de1

example : limit = 15 := by decide
example : specMeets 15 = meets 15 := agree_spec_impl 15
example : specMeets 16 = meets 16 := agree_spec_impl 16
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod96f2895de1
