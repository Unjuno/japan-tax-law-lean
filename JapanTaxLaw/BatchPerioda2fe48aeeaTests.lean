import JapanTaxLaw.BatchPerioda2fe48aeeaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPerioda2fe48aeea

example : limit = 3 := by decide
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 4 = meets 4 := agree_spec_impl 4
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPerioda2fe48aeea
