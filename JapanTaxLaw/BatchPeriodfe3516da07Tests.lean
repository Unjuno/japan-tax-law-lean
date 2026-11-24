import JapanTaxLaw.BatchPeriodfe3516da07Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodfe3516da07

example : limit = 2 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodfe3516da07
