import JapanTaxLaw.BatchRange48c902b5a1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange48c902b5a1

example : lowerYen = 10000000 := by decide
example : upperYen = 100000000 := by decide
example : inRange 10000000 = false := by decide
example : inRange 10000001 = true := by decide
example : inRange 100000000 = true := by decide
example : inRange 100000001 = false := by decide
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000
example : specInRange 10000001 = inRange 10000001 := agree_spec_impl 10000001
example : specInRange 100000000 = inRange 100000000 := agree_spec_impl 100000000

end JapanTaxLaw.BatchRange48c902b5a1
