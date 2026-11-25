import JapanTaxLaw.BatchFraction819bb1519aSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction819bb1519a

example : den = 10 := by decide
example : specMeets 0 10 = meets 0 10 := agree_spec_impl 0 10
example : specMeets 1 10 = meets 1 10 := agree_spec_impl 1 10
example : specMeets 2 10 = meets 2 10 := agree_spec_impl 2 10

end JapanTaxLaw.BatchFraction819bb1519a
