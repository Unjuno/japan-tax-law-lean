import JapanTaxLaw.BatchRange1ed28fa092Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange1ed28fa092

example : lowerYen = 15000000 := by decide
example : upperYen = 30000000 := by decide
example : inRange 15000000 = false := by decide
example : inRange 15000001 = true := by decide
example : inRange 30000000 = true := by decide
example : inRange 30000001 = false := by decide
example : specInRange 15000000 = inRange 15000000 := agree_spec_impl 15000000
example : specInRange 15000001 = inRange 15000001 := agree_spec_impl 15000001
example : specInRange 30000000 = inRange 30000000 := agree_spec_impl 30000000

end JapanTaxLaw.BatchRange1ed28fa092
