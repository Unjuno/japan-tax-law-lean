import JapanTaxLaw.BatchPeriodccb3b8856fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodccb3b8856f

example : limit = 10 := by decide
example : specMeets 10 = meets 10 := agree_spec_impl 10
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodccb3b8856f
