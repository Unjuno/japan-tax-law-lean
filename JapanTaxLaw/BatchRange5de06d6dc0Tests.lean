import JapanTaxLaw.BatchRange5de06d6dc0Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange5de06d6dc0

example : lowerYen = 10000 := by decide
example : upperYen = 20000 := by decide
example : inRange 10000 = false := by decide
example : inRange 10001 = true := by decide
example : inRange 20000 = true := by decide
example : inRange 20001 = false := by decide
example : specInRange 10000 = inRange 10000 := agree_spec_impl 10000
example : specInRange 10001 = inRange 10001 := agree_spec_impl 10001
example : specInRange 20000 = inRange 20000 := agree_spec_impl 20000

end JapanTaxLaw.BatchRange5de06d6dc0
