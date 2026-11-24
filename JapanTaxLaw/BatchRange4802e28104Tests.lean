import JapanTaxLaw.BatchRange4802e28104Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange4802e28104

example : lowerYen = 25000000 := by decide
example : upperYen = 30000000 := by decide
example : inRange 25000000 = false := by decide
example : inRange 25000001 = true := by decide
example : inRange 30000000 = true := by decide
example : inRange 30000001 = false := by decide
example : specInRange 25000000 = inRange 25000000 := agree_spec_impl 25000000
example : specInRange 25000001 = inRange 25000001 := agree_spec_impl 25000001
example : specInRange 30000000 = inRange 30000000 := agree_spec_impl 30000000

end JapanTaxLaw.BatchRange4802e28104
