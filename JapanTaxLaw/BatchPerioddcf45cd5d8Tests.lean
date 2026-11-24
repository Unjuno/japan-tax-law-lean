import JapanTaxLaw.BatchPerioddcf45cd5d8Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPerioddcf45cd5d8

example : limit = 180 := by decide
example : specMeets 180 = meets 180 := agree_spec_impl 180
example : specMeets 181 = meets 181 := agree_spec_impl 181
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPerioddcf45cd5d8
