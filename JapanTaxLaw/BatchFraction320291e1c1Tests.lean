import JapanTaxLaw.BatchFraction320291e1c1Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction320291e1c1

example : den = 5 := by decide
example : specMeets 0 5 = meets 0 5 := agree_spec_impl 0 5
example : specMeets 1 5 = meets 1 5 := agree_spec_impl 1 5
example : specMeets 2 5 = meets 2 5 := agree_spec_impl 2 5

end JapanTaxLaw.BatchFraction320291e1c1
