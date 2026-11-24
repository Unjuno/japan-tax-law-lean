import JapanTaxLaw.BatchRange327f2ebbbfSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange327f2ebbbf

example : lowerYen = 6000000 := by decide
example : upperYen = 10000000 := by decide
example : inRange 6000000 = false := by decide
example : inRange 6000001 = true := by decide
example : inRange 10000000 = true := by decide
example : inRange 10000001 = false := by decide
example : specInRange 6000000 = inRange 6000000 := agree_spec_impl 6000000
example : specInRange 6000001 = inRange 6000001 := agree_spec_impl 6000001
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000

end JapanTaxLaw.BatchRange327f2ebbbf
