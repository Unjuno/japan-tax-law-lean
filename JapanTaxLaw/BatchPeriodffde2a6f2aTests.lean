import JapanTaxLaw.BatchPeriodffde2a6f2aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodffde2a6f2a

example : limit = 1 := by decide
example : specMeets 0 = meets 0 := agree_spec_impl 0
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodffde2a6f2a
