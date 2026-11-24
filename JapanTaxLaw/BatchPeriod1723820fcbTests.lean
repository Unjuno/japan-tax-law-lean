import JapanTaxLaw.BatchPeriod1723820fcbSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod1723820fcb

example : limit = 20 := by decide
example : specMeets 20 = meets 20 := agree_spec_impl 20
example : specMeets 21 = meets 21 := agree_spec_impl 21
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod1723820fcb
