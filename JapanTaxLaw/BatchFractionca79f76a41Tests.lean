import JapanTaxLaw.BatchFractionca79f76a41Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractionca79f76a41

example : den = 10 := by decide
example : specMeets 0 10 = meets 0 10 := agree_spec_impl 0 10
example : specMeets 1 10 = meets 1 10 := agree_spec_impl 1 10
example : specMeets 2 10 = meets 2 10 := agree_spec_impl 2 10

end JapanTaxLaw.BatchFractionca79f76a41
