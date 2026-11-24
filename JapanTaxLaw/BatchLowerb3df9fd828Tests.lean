import JapanTaxLaw.BatchLowerb3df9fd828Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowerb3df9fd828

example : lowerYen = 1000000000 := by decide
example : meets 999999999 = false := by decide
example : meets 1000000000 = true := by decide
example : specMeets 999999999 = meets 999999999 := agree_spec_impl 999999999
example : specMeets 1000000000 = meets 1000000000 := agree_spec_impl 1000000000
example : specMeets 2000000000 = meets 2000000000 := agree_spec_impl 2000000000

end JapanTaxLaw.BatchLowerb3df9fd828
