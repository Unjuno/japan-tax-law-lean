import JapanTaxLaw.BatchRange282d9856f2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange282d9856f2

example : lowerYen = 30000000 := by decide
example : upperYen = 40000000 := by decide
example : inRange 30000000 = false := by decide
example : inRange 30000001 = true := by decide
example : inRange 40000000 = true := by decide
example : inRange 40000001 = false := by decide
example : specInRange 30000000 = inRange 30000000 := agree_spec_impl 30000000
example : specInRange 30000001 = inRange 30000001 := agree_spec_impl 30000001
example : specInRange 40000000 = inRange 40000000 := agree_spec_impl 40000000

end JapanTaxLaw.BatchRange282d9856f2
