import JapanTaxLaw.BatchPeriod9ee9195b05Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod9ee9195b05

example : limit = 1 := by decide
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod9ee9195b05
