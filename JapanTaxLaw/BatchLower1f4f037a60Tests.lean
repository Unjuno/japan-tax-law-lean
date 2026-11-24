import JapanTaxLaw.BatchLower1f4f037a60Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower1f4f037a60

example : lowerYen = 80000000 := by decide
example : meets 79999999 = false := by decide
example : meets 80000000 = true := by decide
example : specMeets 79999999 = meets 79999999 := agree_spec_impl 79999999
example : specMeets 80000000 = meets 80000000 := agree_spec_impl 80000000
example : specMeets 160000000 = meets 160000000 := agree_spec_impl 160000000

end JapanTaxLaw.BatchLower1f4f037a60
