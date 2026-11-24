import JapanTaxLaw.BatchRange1072abd81bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange1072abd81b

example : lowerYen = 200000000 := by decide
example : upperYen = 300000000 := by decide
example : inRange 200000000 = false := by decide
example : inRange 200000001 = true := by decide
example : inRange 300000000 = true := by decide
example : inRange 300000001 = false := by decide
example : specInRange 200000000 = inRange 200000000 := agree_spec_impl 200000000
example : specInRange 200000001 = inRange 200000001 := agree_spec_impl 200000001
example : specInRange 300000000 = inRange 300000000 := agree_spec_impl 300000000

end JapanTaxLaw.BatchRange1072abd81b
