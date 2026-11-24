import JapanTaxLaw.BatchRangede3f4bd387Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangede3f4bd387

example : lowerYen = 2000000 := by decide
example : upperYen = 3000000 := by decide
example : inRange 2000000 = false := by decide
example : inRange 2000001 = true := by decide
example : inRange 3000000 = true := by decide
example : inRange 3000001 = false := by decide
example : specInRange 2000000 = inRange 2000000 := agree_spec_impl 2000000
example : specInRange 2000001 = inRange 2000001 := agree_spec_impl 2000001
example : specInRange 3000000 = inRange 3000000 := agree_spec_impl 3000000

end JapanTaxLaw.BatchRangede3f4bd387
