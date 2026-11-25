import JapanTaxLaw.BatchFractionb1de5e645eSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractionb1de5e645e

example : den = 4 := by decide
example : specMeets 0 4 = meets 0 4 := agree_spec_impl 0 4
example : specMeets 1 4 = meets 1 4 := agree_spec_impl 1 4
example : specMeets 2 4 = meets 2 4 := agree_spec_impl 2 4

end JapanTaxLaw.BatchFractionb1de5e645e
