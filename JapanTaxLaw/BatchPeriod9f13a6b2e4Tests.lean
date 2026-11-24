import JapanTaxLaw.BatchPeriod9f13a6b2e4Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod9f13a6b2e4

example : limit = 7 := by decide
example : specMeets 7 = meets 7 := agree_spec_impl 7
example : specMeets 8 = meets 8 := agree_spec_impl 8
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod9f13a6b2e4
