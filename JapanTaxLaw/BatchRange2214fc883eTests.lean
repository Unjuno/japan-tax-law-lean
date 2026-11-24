import JapanTaxLaw.BatchRange2214fc883eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange2214fc883e

example : lowerYen = 1000000 := by decide
example : upperYen = 5000000 := by decide
example : inRange 1000000 = false := by decide
example : inRange 1000001 = true := by decide
example : inRange 5000000 = true := by decide
example : inRange 5000001 = false := by decide
example : specInRange 1000000 = inRange 1000000 := agree_spec_impl 1000000
example : specInRange 1000001 = inRange 1000001 := agree_spec_impl 1000001
example : specInRange 5000000 = inRange 5000000 := agree_spec_impl 5000000

end JapanTaxLaw.BatchRange2214fc883e
