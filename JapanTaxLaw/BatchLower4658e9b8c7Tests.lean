import JapanTaxLaw.BatchLower4658e9b8c7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower4658e9b8c7

example : lowerYen = 250000 := by decide
example : meets 249999 = false := by decide
example : meets 250000 = true := by decide
example : specMeets 249999 = meets 249999 := agree_spec_impl 249999
example : specMeets 250000 = meets 250000 := agree_spec_impl 250000
example : specMeets 500000 = meets 500000 := agree_spec_impl 500000

end JapanTaxLaw.BatchLower4658e9b8c7
