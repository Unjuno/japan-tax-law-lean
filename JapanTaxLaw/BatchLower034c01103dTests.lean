import JapanTaxLaw.BatchLower034c01103dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower034c01103d

example : lowerYen = 300000 := by decide
example : meets 299999 = false := by decide
example : meets 300000 = true := by decide
example : specMeets 299999 = meets 299999 := agree_spec_impl 299999
example : specMeets 300000 = meets 300000 := agree_spec_impl 300000
example : specMeets 600000 = meets 600000 := agree_spec_impl 600000

end JapanTaxLaw.BatchLower034c01103d
