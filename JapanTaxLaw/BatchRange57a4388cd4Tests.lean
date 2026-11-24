import JapanTaxLaw.BatchRange57a4388cd4Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange57a4388cd4

example : lowerYen = 3600000 := by decide
example : upperYen = 6600000 := by decide
example : inRange 3600000 = false := by decide
example : inRange 3600001 = true := by decide
example : inRange 6600000 = true := by decide
example : inRange 6600001 = false := by decide
example : specInRange 3600000 = inRange 3600000 := agree_spec_impl 3600000
example : specInRange 3600001 = inRange 3600001 := agree_spec_impl 3600001
example : specInRange 6600000 = inRange 6600000 := agree_spec_impl 6600000

end JapanTaxLaw.BatchRange57a4388cd4
