import JapanTaxLaw.BatchPeriodcd9174e2abSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodcd9174e2ab

example : limit = 3 := by decide
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 4 = meets 4 := agree_spec_impl 4
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodcd9174e2ab
