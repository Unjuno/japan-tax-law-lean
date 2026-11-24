import JapanTaxLaw.BatchPeriodde9b70a4c5Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodde9b70a4c5

example : limit = 50 := by decide
example : specMeets 50 = meets 50 := agree_spec_impl 50
example : specMeets 51 = meets 51 := agree_spec_impl 51
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodde9b70a4c5
