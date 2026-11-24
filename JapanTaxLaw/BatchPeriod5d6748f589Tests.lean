import JapanTaxLaw.BatchPeriod5d6748f589Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod5d6748f589

example : limit = 3 := by decide
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 4 = meets 4 := agree_spec_impl 4
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod5d6748f589
