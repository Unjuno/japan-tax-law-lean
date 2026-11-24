import JapanTaxLaw.BatchRange090b744dd2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange090b744dd2

example : lowerYen = 9000000 := by decide
example : upperYen = 18000000 := by decide
example : inRange 9000000 = false := by decide
example : inRange 9000001 = true := by decide
example : inRange 18000000 = true := by decide
example : inRange 18000001 = false := by decide
example : specInRange 9000000 = inRange 9000000 := agree_spec_impl 9000000
example : specInRange 9000001 = inRange 9000001 := agree_spec_impl 9000001
example : specInRange 18000000 = inRange 18000000 := agree_spec_impl 18000000

end JapanTaxLaw.BatchRange090b744dd2
