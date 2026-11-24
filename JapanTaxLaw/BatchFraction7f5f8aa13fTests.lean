import JapanTaxLaw.BatchFraction7f5f8aa13fSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction7f5f8aa13f

example : den = 2 := by decide
example : specMeets 0 2 = meets 0 2 := agree_spec_impl 0 2
example : specMeets 1 2 = meets 1 2 := agree_spec_impl 1 2
example : specMeets 2 2 = meets 2 2 := agree_spec_impl 2 2

end JapanTaxLaw.BatchFraction7f5f8aa13f
