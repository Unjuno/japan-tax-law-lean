import JapanTaxLaw.BatchRange584049b025Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange584049b025

example : lowerYen = 50000000 := by decide
example : upperYen = 80000000 := by decide
example : inRange 50000000 = false := by decide
example : inRange 50000001 = true := by decide
example : inRange 80000000 = true := by decide
example : inRange 80000001 = false := by decide
example : specInRange 50000000 = inRange 50000000 := agree_spec_impl 50000000
example : specInRange 50000001 = inRange 50000001 := agree_spec_impl 50000001
example : specInRange 80000000 = inRange 80000000 := agree_spec_impl 80000000

end JapanTaxLaw.BatchRange584049b025
