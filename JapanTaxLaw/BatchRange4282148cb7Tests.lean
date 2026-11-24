import JapanTaxLaw.BatchRange4282148cb7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange4282148cb7

example : lowerYen = 1900000 := by decide
example : upperYen = 3600000 := by decide
example : inRange 1900000 = false := by decide
example : inRange 1900001 = true := by decide
example : inRange 3600000 = true := by decide
example : inRange 3600001 = false := by decide
example : specInRange 1900000 = inRange 1900000 := agree_spec_impl 1900000
example : specInRange 1900001 = inRange 1900001 := agree_spec_impl 1900001
example : specInRange 3600000 = inRange 3600000 := agree_spec_impl 3600000

end JapanTaxLaw.BatchRange4282148cb7
