import JapanTaxLaw.BatchFraction1263e303fcSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction1263e303fc

example : den = 4 := by decide
example : specMeets 0 4 = meets 0 4 := agree_spec_impl 0 4
example : specMeets 1 4 = meets 1 4 := agree_spec_impl 1 4
example : specMeets 2 4 = meets 2 4 := agree_spec_impl 2 4

end JapanTaxLaw.BatchFraction1263e303fc
