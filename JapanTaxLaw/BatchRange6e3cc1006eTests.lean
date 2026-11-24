import JapanTaxLaw.BatchRange6e3cc1006eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange6e3cc1006e

example : lowerYen = 18000000 := by decide
example : upperYen = 40000000 := by decide
example : inRange 18000000 = false := by decide
example : inRange 18000001 = true := by decide
example : inRange 40000000 = true := by decide
example : inRange 40000001 = false := by decide
example : specInRange 18000000 = inRange 18000000 := agree_spec_impl 18000000
example : specInRange 18000001 = inRange 18000001 := agree_spec_impl 18000001
example : specInRange 40000000 = inRange 40000000 := agree_spec_impl 40000000

end JapanTaxLaw.BatchRange6e3cc1006e
