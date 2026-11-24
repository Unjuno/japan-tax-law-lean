import JapanTaxLaw.BatchRange39953d5153Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange39953d5153

example : lowerYen = 40000000 := by decide
example : upperYen = 50000000 := by decide
example : inRange 40000000 = false := by decide
example : inRange 40000001 = true := by decide
example : inRange 50000000 = true := by decide
example : inRange 50000001 = false := by decide
example : specInRange 40000000 = inRange 40000000 := agree_spec_impl 40000000
example : specInRange 40000001 = inRange 40000001 := agree_spec_impl 40000001
example : specInRange 50000000 = inRange 50000000 := agree_spec_impl 50000000

end JapanTaxLaw.BatchRange39953d5153
