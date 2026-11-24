import JapanTaxLaw.BatchRangee8138ae6a6Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangee8138ae6a6

example : lowerYen = 100000000000 := by decide
example : upperYen = 500000000000 := by decide
example : inRange 100000000000 = false := by decide
example : inRange 100000000001 = true := by decide
example : inRange 500000000000 = true := by decide
example : inRange 500000000001 = false := by decide
example : specInRange 100000000000 = inRange 100000000000 := agree_spec_impl 100000000000
example : specInRange 100000000001 = inRange 100000000001 := agree_spec_impl 100000000001
example : specInRange 500000000000 = inRange 500000000000 := agree_spec_impl 500000000000

end JapanTaxLaw.BatchRangee8138ae6a6
