import JapanTaxLaw.BatchPeriodaeb76b8764Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodaeb76b8764

example : limit = 55 := by decide
example : specMeets 55 = meets 55 := agree_spec_impl 55
example : specMeets 56 = meets 56 := agree_spec_impl 56
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodaeb76b8764
