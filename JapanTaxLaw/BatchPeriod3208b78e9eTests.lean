import JapanTaxLaw.BatchPeriod3208b78e9eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod3208b78e9e

example : limit = 6 := by decide
example : specMeets 6 = meets 6 := agree_spec_impl 6
example : specMeets 7 = meets 7 := agree_spec_impl 7
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod3208b78e9e
