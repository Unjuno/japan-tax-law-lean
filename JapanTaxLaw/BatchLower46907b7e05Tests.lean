import JapanTaxLaw.BatchLower46907b7e05Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower46907b7e05

example : lowerYen = 10000000 := by decide
example : meets 9999999 = false := by decide
example : meets 10000000 = true := by decide
example : specMeets 9999999 = meets 9999999 := agree_spec_impl 9999999
example : specMeets 10000000 = meets 10000000 := agree_spec_impl 10000000
example : specMeets 20000000 = meets 20000000 := agree_spec_impl 20000000

end JapanTaxLaw.BatchLower46907b7e05
