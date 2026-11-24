import JapanTaxLaw.BatchLowercda61eb1a1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowercda61eb1a1

example : lowerYen = 400000 := by decide
example : meets 399999 = false := by decide
example : meets 400000 = true := by decide
example : specMeets 399999 = meets 399999 := agree_spec_impl 399999
example : specMeets 400000 = meets 400000 := agree_spec_impl 400000
example : specMeets 800000 = meets 800000 := agree_spec_impl 800000

end JapanTaxLaw.BatchLowercda61eb1a1
