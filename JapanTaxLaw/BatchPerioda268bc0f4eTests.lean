import JapanTaxLaw.BatchPerioda268bc0f4eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPerioda268bc0f4e

example : limit = 1 := by decide
example : specMeets 0 = meets 0 := agree_spec_impl 0
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPerioda268bc0f4e
