import JapanTaxLaw.BatchRangea017cdb9b6Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangea017cdb9b6

example : lowerYen = 2000000 := by decide
example : upperYen = 4000000 := by decide
example : inRange 2000000 = false := by decide
example : inRange 2000001 = true := by decide
example : inRange 4000000 = true := by decide
example : inRange 4000001 = false := by decide
example : specInRange 2000000 = inRange 2000000 := agree_spec_impl 2000000
example : specInRange 2000001 = inRange 2000001 := agree_spec_impl 2000001
example : specInRange 4000000 = inRange 4000000 := agree_spec_impl 4000000

end JapanTaxLaw.BatchRangea017cdb9b6
