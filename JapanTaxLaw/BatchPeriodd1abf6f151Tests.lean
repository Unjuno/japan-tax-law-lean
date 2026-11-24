import JapanTaxLaw.BatchPeriodd1abf6f151Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodd1abf6f151

example : limit = 20 := by decide
example : specMeets 20 = meets 20 := agree_spec_impl 20
example : specMeets 21 = meets 21 := agree_spec_impl 21
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodd1abf6f151
