import JapanTaxLaw.BatchLowerb1be295d9fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowerb1be295d9f

example : lowerYen = 43 := by decide
example : meets 42 = false := by decide
example : meets 43 = true := by decide
example : specMeets 42 = meets 42 := agree_spec_impl 42
example : specMeets 43 = meets 43 := agree_spec_impl 43
example : specMeets 86 = meets 86 := agree_spec_impl 86

end JapanTaxLaw.BatchLowerb1be295d9f
