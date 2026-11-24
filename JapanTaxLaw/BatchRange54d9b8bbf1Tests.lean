import JapanTaxLaw.BatchRange54d9b8bbf1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange54d9b8bbf1

example : lowerYen = 6600000 := by decide
example : upperYen = 8500000 := by decide
example : inRange 6600000 = false := by decide
example : inRange 6600001 = true := by decide
example : inRange 8500000 = true := by decide
example : inRange 8500001 = false := by decide
example : specInRange 6600000 = inRange 6600000 := agree_spec_impl 6600000
example : specInRange 6600001 = inRange 6600001 := agree_spec_impl 6600001
example : specInRange 8500000 = inRange 8500000 := agree_spec_impl 8500000

end JapanTaxLaw.BatchRange54d9b8bbf1
