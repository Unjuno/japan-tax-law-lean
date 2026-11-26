import JapanTaxLaw.BatchPeriodec8375b175Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodec8375b175

example : limit = 5 := by decide
example : specMeets 4 = meets 4 := agree_spec_impl 4
example : specMeets 5 = meets 5 := agree_spec_impl 5
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodec8375b175
