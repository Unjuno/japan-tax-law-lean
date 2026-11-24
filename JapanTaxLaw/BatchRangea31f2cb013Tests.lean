import JapanTaxLaw.BatchRangea31f2cb013Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangea31f2cb013

example : lowerYen = 4500000 := by decide
example : upperYen = 6000000 := by decide
example : inRange 4500000 = false := by decide
example : inRange 4500001 = true := by decide
example : inRange 6000000 = true := by decide
example : inRange 6000001 = false := by decide
example : specInRange 4500000 = inRange 4500000 := agree_spec_impl 4500000
example : specInRange 4500001 = inRange 4500001 := agree_spec_impl 4500001
example : specInRange 6000000 = inRange 6000000 := agree_spec_impl 6000000

end JapanTaxLaw.BatchRangea31f2cb013
