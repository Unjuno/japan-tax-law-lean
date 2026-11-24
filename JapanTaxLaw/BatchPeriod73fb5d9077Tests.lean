import JapanTaxLaw.BatchPeriod73fb5d9077Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod73fb5d9077

example : limit = 10 := by decide
example : specMeets 10 = meets 10 := agree_spec_impl 10
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod73fb5d9077
