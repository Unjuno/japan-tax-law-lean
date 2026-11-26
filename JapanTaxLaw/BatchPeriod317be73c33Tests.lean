import JapanTaxLaw.BatchPeriod317be73c33Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod317be73c33

example : limit = 15 := by decide
example : specMeets 15 = meets 15 := agree_spec_impl 15
example : specMeets 16 = meets 16 := agree_spec_impl 16
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod317be73c33
