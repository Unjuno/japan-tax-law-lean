import JapanTaxLaw.BatchFractionf8cda341dcSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractionf8cda341dc

example : den = 10 := by decide
example : specMeets 0 10 = meets 0 10 := agree_spec_impl 0 10
example : specMeets 1 10 = meets 1 10 := agree_spec_impl 1 10
example : specMeets 2 10 = meets 2 10 := agree_spec_impl 2 10

end JapanTaxLaw.BatchFractionf8cda341dc
