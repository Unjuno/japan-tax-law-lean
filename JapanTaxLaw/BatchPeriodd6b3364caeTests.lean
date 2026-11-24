import JapanTaxLaw.BatchPeriodd6b3364caeSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodd6b3364cae

example : limit = 45 := by decide
example : specMeets 45 = meets 45 := agree_spec_impl 45
example : specMeets 46 = meets 46 := agree_spec_impl 46
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodd6b3364cae
