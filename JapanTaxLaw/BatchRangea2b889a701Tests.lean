import JapanTaxLaw.BatchRangea2b889a701Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangea2b889a701

example : lowerYen = 3300000 := by decide
example : upperYen = 6950000 := by decide
example : inRange 3300000 = false := by decide
example : inRange 3300001 = true := by decide
example : inRange 6950000 = true := by decide
example : inRange 6950001 = false := by decide
example : specInRange 3300000 = inRange 3300000 := agree_spec_impl 3300000
example : specInRange 3300001 = inRange 3300001 := agree_spec_impl 3300001
example : specInRange 6950000 = inRange 6950000 := agree_spec_impl 6950000

end JapanTaxLaw.BatchRangea2b889a701
