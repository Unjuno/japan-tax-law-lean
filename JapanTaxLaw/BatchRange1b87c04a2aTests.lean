import JapanTaxLaw.BatchRange1b87c04a2aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange1b87c04a2a

example : lowerYen = 4000000 := by decide
example : upperYen = 6000000 := by decide
example : inRange 4000000 = false := by decide
example : inRange 4000001 = true := by decide
example : inRange 6000000 = true := by decide
example : inRange 6000001 = false := by decide
example : specInRange 4000000 = inRange 4000000 := agree_spec_impl 4000000
example : specInRange 4000001 = inRange 4000001 := agree_spec_impl 4000001
example : specInRange 6000000 = inRange 6000000 := agree_spec_impl 6000000

end JapanTaxLaw.BatchRange1b87c04a2a
