import JapanTaxLaw.BatchRange8fda8e1022Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange8fda8e1022

example : lowerYen = 9000000 := by decide
example : upperYen = 9500000 := by decide
example : inRange 9000000 = false := by decide
example : inRange 9000001 = true := by decide
example : inRange 9500000 = true := by decide
example : inRange 9500001 = false := by decide
example : specInRange 9000000 = inRange 9000000 := agree_spec_impl 9000000
example : specInRange 9000001 = inRange 9000001 := agree_spec_impl 9000001
example : specInRange 9500000 = inRange 9500000 := agree_spec_impl 9500000

end JapanTaxLaw.BatchRange8fda8e1022
