import JapanTaxLaw.BatchPeriod4da4187fd6Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod4da4187fd6

example : limit = 20 := by decide
example : specMeets 20 = meets 20 := agree_spec_impl 20
example : specMeets 21 = meets 21 := agree_spec_impl 21
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod4da4187fd6
