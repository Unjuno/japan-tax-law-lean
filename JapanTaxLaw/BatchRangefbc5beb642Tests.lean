import JapanTaxLaw.BatchRangefbc5beb642Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangefbc5beb642

example : lowerYen = 1150000 := by decide
example : upperYen = 1200000 := by decide
example : inRange 1150000 = false := by decide
example : inRange 1150001 = true := by decide
example : inRange 1200000 = true := by decide
example : inRange 1200001 = false := by decide
example : specInRange 1150000 = inRange 1150000 := agree_spec_impl 1150000
example : specInRange 1150001 = inRange 1150001 := agree_spec_impl 1150001
example : specInRange 1200000 = inRange 1200000 := agree_spec_impl 1200000

end JapanTaxLaw.BatchRangefbc5beb642
