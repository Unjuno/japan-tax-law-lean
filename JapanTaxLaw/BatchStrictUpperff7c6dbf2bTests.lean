import JapanTaxLaw.BatchStrictUpperff7c6dbf2bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpperff7c6dbf2b

example : upperYen = 200000 := by decide
example : meets 199999 = true := by decide
example : meets 200000 = false := by decide
example : specMeets 199999 = meets 199999 := agree_spec_impl 199999
example : specMeets 200000 = meets 200000 := agree_spec_impl 200000
example : specMeets 200001 = meets 200001 := agree_spec_impl 200001

end JapanTaxLaw.BatchStrictUpperff7c6dbf2b
