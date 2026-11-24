import JapanTaxLaw.BatchRangece27f51ca9Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangece27f51ca9

example : lowerYen = 30000000 := by decide
example : upperYen = 45000000 := by decide
example : inRange 30000000 = false := by decide
example : inRange 30000001 = true := by decide
example : inRange 45000000 = true := by decide
example : inRange 45000001 = false := by decide
example : specInRange 30000000 = inRange 30000000 := agree_spec_impl 30000000
example : specInRange 30000001 = inRange 30000001 := agree_spec_impl 30000001
example : specInRange 45000000 = inRange 45000000 := agree_spec_impl 45000000

end JapanTaxLaw.BatchRangece27f51ca9
