import JapanTaxLaw.BatchPeriod439ef97d7aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod439ef97d7a

example : limit = 4 := by decide
example : specMeets 4 = meets 4 := agree_spec_impl 4
example : specMeets 5 = meets 5 := agree_spec_impl 5
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod439ef97d7a
