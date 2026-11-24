import JapanTaxLaw.BatchRange661b4ef18fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange661b4ef18f

example : lowerYen = 300000000 := by decide
example : upperYen = 600000000 := by decide
example : inRange 300000000 = false := by decide
example : inRange 300000001 = true := by decide
example : inRange 600000000 = true := by decide
example : inRange 600000001 = false := by decide
example : specInRange 300000000 = inRange 300000000 := agree_spec_impl 300000000
example : specInRange 300000001 = inRange 300000001 := agree_spec_impl 300000001
example : specInRange 600000000 = inRange 600000000 := agree_spec_impl 600000000

end JapanTaxLaw.BatchRange661b4ef18f
