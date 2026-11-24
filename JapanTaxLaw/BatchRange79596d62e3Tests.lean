import JapanTaxLaw.BatchRange79596d62e3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange79596d62e3

example : lowerYen = 10000000 := by decide
example : upperYen = 15000000 := by decide
example : inRange 10000000 = false := by decide
example : inRange 10000001 = true := by decide
example : inRange 15000000 = true := by decide
example : inRange 15000001 = false := by decide
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000
example : specInRange 10000001 = inRange 10000001 := agree_spec_impl 10000001
example : specInRange 15000000 = inRange 15000000 := agree_spec_impl 15000000

end JapanTaxLaw.BatchRange79596d62e3
