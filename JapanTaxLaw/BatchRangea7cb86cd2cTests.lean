import JapanTaxLaw.BatchRangea7cb86cd2cSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangea7cb86cd2c

example : lowerYen = 80000000 := by decide
example : upperYen = 100000000 := by decide
example : inRange 80000000 = false := by decide
example : inRange 80000001 = true := by decide
example : inRange 100000000 = true := by decide
example : inRange 100000001 = false := by decide
example : specInRange 80000000 = inRange 80000000 := agree_spec_impl 80000000
example : specInRange 80000001 = inRange 80000001 := agree_spec_impl 80000001
example : specInRange 100000000 = inRange 100000000 := agree_spec_impl 100000000

end JapanTaxLaw.BatchRangea7cb86cd2c
