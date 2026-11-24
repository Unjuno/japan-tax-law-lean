import JapanTaxLaw.BatchPeriod46c51f5600Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod46c51f5600

example : limit = 2 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod46c51f5600
