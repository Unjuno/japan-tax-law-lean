import JapanTaxLaw.BatchFraction5d2a5c0c38Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction5d2a5c0c38

example : den = 6 := by decide
example : specMeets 0 6 = meets 0 6 := agree_spec_impl 0 6
example : specMeets 1 6 = meets 1 6 := agree_spec_impl 1 6
example : specMeets 2 6 = meets 2 6 := agree_spec_impl 2 6

end JapanTaxLaw.BatchFraction5d2a5c0c38
