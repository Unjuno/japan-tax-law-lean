import JapanTaxLaw.BatchFraction45fc71a2ccSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction45fc71a2cc

example : den = 3 := by decide
example : specMeets 0 3 = meets 0 3 := agree_spec_impl 0 3
example : specMeets 1 3 = meets 1 3 := agree_spec_impl 1 3
example : specMeets 2 3 = meets 2 3 := agree_spec_impl 2 3

end JapanTaxLaw.BatchFraction45fc71a2cc
