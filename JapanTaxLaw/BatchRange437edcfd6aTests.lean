import JapanTaxLaw.BatchRange437edcfd6aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange437edcfd6a

example : lowerYen = 30000000 := by decide
example : upperYen = 50000000 := by decide
example : inRange 30000000 = false := by decide
example : inRange 30000001 = true := by decide
example : inRange 50000000 = true := by decide
example : inRange 50000001 = false := by decide
example : specInRange 30000000 = inRange 30000000 := agree_spec_impl 30000000
example : specInRange 30000001 = inRange 30000001 := agree_spec_impl 30000001
example : specInRange 50000000 = inRange 50000000 := agree_spec_impl 50000000

end JapanTaxLaw.BatchRange437edcfd6a
