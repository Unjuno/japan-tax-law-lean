import JapanTaxLaw.BatchPeriod5af454c0f2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod5af454c0f2

example : limit = 60 := by decide
example : specMeets 60 = meets 60 := agree_spec_impl 60
example : specMeets 61 = meets 61 := agree_spec_impl 61
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod5af454c0f2
