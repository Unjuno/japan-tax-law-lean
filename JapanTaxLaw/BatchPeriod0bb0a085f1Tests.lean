import JapanTaxLaw.BatchPeriod0bb0a085f1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod0bb0a085f1

example : limit = 25 := by decide
example : specMeets 25 = meets 25 := agree_spec_impl 25
example : specMeets 26 = meets 26 := agree_spec_impl 26
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod0bb0a085f1
