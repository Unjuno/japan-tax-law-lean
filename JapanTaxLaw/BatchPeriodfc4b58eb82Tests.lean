import JapanTaxLaw.BatchPeriodfc4b58eb82Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodfc4b58eb82

example : limit = 10 := by decide
example : specMeets 10 = meets 10 := agree_spec_impl 10
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodfc4b58eb82
