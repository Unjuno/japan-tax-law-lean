import JapanTaxLaw.BatchRangeb837a7eb46Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangeb837a7eb46

example : lowerYen = 1000000 := by decide
example : upperYen = 2000000 := by decide
example : inRange 1000000 = false := by decide
example : inRange 1000001 = true := by decide
example : inRange 2000000 = true := by decide
example : inRange 2000001 = false := by decide
example : specInRange 1000000 = inRange 1000000 := agree_spec_impl 1000000
example : specInRange 1000001 = inRange 1000001 := agree_spec_impl 1000001
example : specInRange 2000000 = inRange 2000000 := agree_spec_impl 2000000

end JapanTaxLaw.BatchRangeb837a7eb46
