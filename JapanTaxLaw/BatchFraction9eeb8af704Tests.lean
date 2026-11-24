import JapanTaxLaw.BatchFraction9eeb8af704Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction9eeb8af704

example : den = 5 := by decide
example : specMeets 0 5 = meets 0 5 := agree_spec_impl 0 5
example : specMeets 1 5 = meets 1 5 := agree_spec_impl 1 5
example : specMeets 2 5 = meets 2 5 := agree_spec_impl 2 5

end JapanTaxLaw.BatchFraction9eeb8af704
