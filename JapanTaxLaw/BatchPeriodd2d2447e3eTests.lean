import JapanTaxLaw.BatchPeriodd2d2447e3eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodd2d2447e3e

example : limit = 5 := by decide
example : specMeets 6 = meets 6 := agree_spec_impl 6
example : specMeets 5 = meets 5 := agree_spec_impl 5
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodd2d2447e3e
