import JapanTaxLaw.BatchRange03e32fb07fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange03e32fb07f

example : lowerYen = 1000000 := by decide
example : upperYen = 1300000 := by decide
example : inRange 1000000 = false := by decide
example : inRange 1000001 = true := by decide
example : inRange 1300000 = true := by decide
example : inRange 1300001 = false := by decide
example : specInRange 1000000 = inRange 1000000 := agree_spec_impl 1000000
example : specInRange 1000001 = inRange 1000001 := agree_spec_impl 1000001
example : specInRange 1300000 = inRange 1300000 := agree_spec_impl 1300000

end JapanTaxLaw.BatchRange03e32fb07f
