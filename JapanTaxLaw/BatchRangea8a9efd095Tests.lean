import JapanTaxLaw.BatchRangea8a9efd095Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangea8a9efd095

example : lowerYen = 100000000 := by decide
example : upperYen = 500000000 := by decide
example : inRange 100000000 = false := by decide
example : inRange 100000001 = true := by decide
example : inRange 500000000 = true := by decide
example : inRange 500000001 = false := by decide
example : specInRange 100000000 = inRange 100000000 := agree_spec_impl 100000000
example : specInRange 100000001 = inRange 100000001 := agree_spec_impl 100000001
example : specInRange 500000000 = inRange 500000000 := agree_spec_impl 500000000

end JapanTaxLaw.BatchRangea8a9efd095
