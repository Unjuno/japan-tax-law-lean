import JapanTaxLaw.BatchPeriod2a013c5b64Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod2a013c5b64

example : limit = 3 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod2a013c5b64
