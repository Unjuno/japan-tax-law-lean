import JapanTaxLaw.BatchFraction47242ab97fSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction47242ab97f

example : den = 6 := by decide
example : specMeets 0 6 = meets 0 6 := agree_spec_impl 0 6
example : specMeets 1 6 = meets 1 6 := agree_spec_impl 1 6
example : specMeets 2 6 = meets 2 6 := agree_spec_impl 2 6

end JapanTaxLaw.BatchFraction47242ab97f
