import JapanTaxLaw.BatchRangefaf3ecea85Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangefaf3ecea85

example : lowerYen = 4000000 := by decide
example : upperYen = 4500000 := by decide
example : inRange 4000000 = false := by decide
example : inRange 4000001 = true := by decide
example : inRange 4500000 = true := by decide
example : inRange 4500001 = false := by decide
example : specInRange 4000000 = inRange 4000000 := agree_spec_impl 4000000
example : specInRange 4000001 = inRange 4000001 := agree_spec_impl 4000001
example : specInRange 4500000 = inRange 4500000 := agree_spec_impl 4500000

end JapanTaxLaw.BatchRangefaf3ecea85
