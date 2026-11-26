import JapanTaxLaw.BatchPeriodc249c0b6adSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodc249c0b6ad

example : limit = 6 := by decide
example : specMeets 6 = meets 6 := agree_spec_impl 6
example : specMeets 7 = meets 7 := agree_spec_impl 7
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodc249c0b6ad
