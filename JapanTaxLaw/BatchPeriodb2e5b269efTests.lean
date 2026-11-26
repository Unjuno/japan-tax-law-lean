import JapanTaxLaw.BatchPeriodb2e5b269efSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodb2e5b269ef

example : limit = 55 := by decide
example : specMeets 56 = meets 56 := agree_spec_impl 56
example : specMeets 55 = meets 55 := agree_spec_impl 55
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodb2e5b269ef
