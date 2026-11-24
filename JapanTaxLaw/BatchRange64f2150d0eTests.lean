import JapanTaxLaw.BatchRange64f2150d0eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange64f2150d0e

example : lowerYen = 3000000 := by decide
example : upperYen = 5000000 := by decide
example : inRange 3000000 = false := by decide
example : inRange 3000001 = true := by decide
example : inRange 5000000 = true := by decide
example : inRange 5000001 = false := by decide
example : specInRange 3000000 = inRange 3000000 := agree_spec_impl 3000000
example : specInRange 3000001 = inRange 3000001 := agree_spec_impl 3000001
example : specInRange 5000000 = inRange 5000000 := agree_spec_impl 5000000

end JapanTaxLaw.BatchRange64f2150d0e
