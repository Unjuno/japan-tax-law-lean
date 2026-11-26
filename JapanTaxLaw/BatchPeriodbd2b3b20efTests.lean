import JapanTaxLaw.BatchPeriodbd2b3b20efSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodbd2b3b20ef

example : limit = 2 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodbd2b3b20ef
