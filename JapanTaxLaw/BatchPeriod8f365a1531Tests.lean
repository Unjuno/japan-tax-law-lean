import JapanTaxLaw.BatchPeriod8f365a1531Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod8f365a1531

example : limit = 2 := by decide
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod8f365a1531
