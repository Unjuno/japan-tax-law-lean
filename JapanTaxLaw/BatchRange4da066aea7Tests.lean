import JapanTaxLaw.BatchRange4da066aea7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange4da066aea7

example : lowerYen = 100000000 := by decide
example : upperYen = 1000000000 := by decide
example : inRange 100000000 = false := by decide
example : inRange 100000001 = true := by decide
example : inRange 1000000000 = true := by decide
example : inRange 1000000001 = false := by decide
example : specInRange 100000000 = inRange 100000000 := agree_spec_impl 100000000
example : specInRange 100000001 = inRange 100000001 := agree_spec_impl 100000001
example : specInRange 1000000000 = inRange 1000000000 := agree_spec_impl 1000000000

end JapanTaxLaw.BatchRange4da066aea7
