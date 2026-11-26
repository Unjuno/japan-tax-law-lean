import JapanTaxLaw.BatchPeriod607002cc00Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod607002cc00

example : limit = 1 := by decide
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod607002cc00
