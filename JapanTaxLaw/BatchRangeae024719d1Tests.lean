import JapanTaxLaw.BatchRangeae024719d1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangeae024719d1

example : lowerYen = 7200000 := by decide
example : upperYen = 9500000 := by decide
example : inRange 7200000 = false := by decide
example : inRange 7200001 = true := by decide
example : inRange 9500000 = true := by decide
example : inRange 9500001 = false := by decide
example : specInRange 7200000 = inRange 7200000 := agree_spec_impl 7200000
example : specInRange 7200001 = inRange 7200001 := agree_spec_impl 7200001
example : specInRange 9500000 = inRange 9500000 := agree_spec_impl 9500000

end JapanTaxLaw.BatchRangeae024719d1
