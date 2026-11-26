import JapanTaxLaw.BatchFractiona3d1171b09Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractiona3d1171b09

example : den = 2 := by decide
example : specMeets 0 2 = meets 0 2 := agree_spec_impl 0 2
example : specMeets 1 2 = meets 1 2 := agree_spec_impl 1 2
example : specMeets 2 2 = meets 2 2 := agree_spec_impl 2 2

end JapanTaxLaw.BatchFractiona3d1171b09
