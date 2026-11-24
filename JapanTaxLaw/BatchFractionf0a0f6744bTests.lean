import JapanTaxLaw.BatchFractionf0a0f6744bSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractionf0a0f6744b

example : den = 5 := by decide
example : specMeets 0 5 = meets 0 5 := agree_spec_impl 0 5
example : specMeets 1 5 = meets 1 5 := agree_spec_impl 1 5
example : specMeets 2 5 = meets 2 5 := agree_spec_impl 2 5

end JapanTaxLaw.BatchFractionf0a0f6744b
