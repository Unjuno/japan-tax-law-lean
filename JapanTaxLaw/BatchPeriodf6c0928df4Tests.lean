import JapanTaxLaw.BatchPeriodf6c0928df4Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodf6c0928df4

example : limit = 1 := by decide
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodf6c0928df4
