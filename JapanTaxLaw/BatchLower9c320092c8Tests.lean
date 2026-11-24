import JapanTaxLaw.BatchLower9c320092c8Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower9c320092c8

example : lowerYen = 700000 := by decide
example : meets 699999 = false := by decide
example : meets 700000 = true := by decide
example : specMeets 699999 = meets 699999 := agree_spec_impl 699999
example : specMeets 700000 = meets 700000 := agree_spec_impl 700000
example : specMeets 1400000 = meets 1400000 := agree_spec_impl 1400000

end JapanTaxLaw.BatchLower9c320092c8
