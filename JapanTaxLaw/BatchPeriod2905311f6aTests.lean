import JapanTaxLaw.BatchPeriod2905311f6aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod2905311f6a

example : limit = 2 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod2905311f6a
