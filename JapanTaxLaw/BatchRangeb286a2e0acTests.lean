import JapanTaxLaw.BatchRangeb286a2e0acSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangeb286a2e0ac

example : lowerYen = 50000000 := by decide
example : upperYen = 100000000 := by decide
example : inRange 50000000 = false := by decide
example : inRange 50000001 = true := by decide
example : inRange 100000000 = true := by decide
example : inRange 100000001 = false := by decide
example : specInRange 50000000 = inRange 50000000 := agree_spec_impl 50000000
example : specInRange 50000001 = inRange 50000001 := agree_spec_impl 50000001
example : specInRange 100000000 = inRange 100000000 := agree_spec_impl 100000000

end JapanTaxLaw.BatchRangeb286a2e0ac
