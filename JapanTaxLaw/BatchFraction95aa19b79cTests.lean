import JapanTaxLaw.BatchFraction95aa19b79cSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction95aa19b79c

example : den = 2 := by decide
example : specMeets 0 2 = meets 0 2 := agree_spec_impl 0 2
example : specMeets 1 2 = meets 1 2 := agree_spec_impl 1 2
example : specMeets 2 2 = meets 2 2 := agree_spec_impl 2 2

end JapanTaxLaw.BatchFraction95aa19b79c
