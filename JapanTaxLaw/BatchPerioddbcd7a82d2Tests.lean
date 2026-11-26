import JapanTaxLaw.BatchPerioddbcd7a82d2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPerioddbcd7a82d2

example : limit = 11 := by decide
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 12 = meets 12 := agree_spec_impl 12
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPerioddbcd7a82d2
