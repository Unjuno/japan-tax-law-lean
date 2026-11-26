import JapanTaxLaw.BatchFractionf33f1531e7Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractionf33f1531e7

example : den = 366 := by decide
example : specMeets 0 366 = meets 0 366 := agree_spec_impl 0 366
example : specMeets 1 366 = meets 1 366 := agree_spec_impl 1 366
example : specMeets 2 366 = meets 2 366 := agree_spec_impl 2 366

end JapanTaxLaw.BatchFractionf33f1531e7
