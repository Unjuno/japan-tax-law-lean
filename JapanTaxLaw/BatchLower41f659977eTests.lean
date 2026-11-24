import JapanTaxLaw.BatchLower41f659977eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower41f659977e

example : lowerYen = 500000000 := by decide
example : meets 499999999 = false := by decide
example : meets 500000000 = true := by decide
example : specMeets 499999999 = meets 499999999 := agree_spec_impl 499999999
example : specMeets 500000000 = meets 500000000 := agree_spec_impl 500000000
example : specMeets 1000000000 = meets 1000000000 := agree_spec_impl 1000000000

end JapanTaxLaw.BatchLower41f659977e
