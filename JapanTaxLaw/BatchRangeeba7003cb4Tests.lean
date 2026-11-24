import JapanTaxLaw.BatchRangeeba7003cb4Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangeeba7003cb4

example : lowerYen = 5000000 := by decide
example : upperYen = 10000000 := by decide
example : inRange 5000000 = false := by decide
example : inRange 5000001 = true := by decide
example : inRange 10000000 = true := by decide
example : inRange 10000001 = false := by decide
example : specInRange 5000000 = inRange 5000000 := agree_spec_impl 5000000
example : specInRange 5000001 = inRange 5000001 := agree_spec_impl 5000001
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000

end JapanTaxLaw.BatchRangeeba7003cb4
