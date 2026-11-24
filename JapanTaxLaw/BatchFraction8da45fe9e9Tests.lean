import JapanTaxLaw.BatchFraction8da45fe9e9Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction8da45fe9e9

example : den = 100 := by decide
example : specMeets 0 100 = meets 0 100 := agree_spec_impl 0 100
example : specMeets 1 100 = meets 1 100 := agree_spec_impl 1 100
example : specMeets 2 100 = meets 2 100 := agree_spec_impl 2 100

end JapanTaxLaw.BatchFraction8da45fe9e9
