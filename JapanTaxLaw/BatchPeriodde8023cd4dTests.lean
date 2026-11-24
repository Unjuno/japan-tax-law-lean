import JapanTaxLaw.BatchPeriodde8023cd4dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodde8023cd4d

example : limit = 10 := by decide
example : specMeets 10 = meets 10 := agree_spec_impl 10
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodde8023cd4d
