import JapanTaxLaw.BatchRanged786dc912eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRanged786dc912e

example : lowerYen = 100000000 := by decide
example : upperYen = 200000000 := by decide
example : inRange 100000000 = false := by decide
example : inRange 100000001 = true := by decide
example : inRange 200000000 = true := by decide
example : inRange 200000001 = false := by decide
example : specInRange 100000000 = inRange 100000000 := agree_spec_impl 100000000
example : specInRange 100000001 = inRange 100000001 := agree_spec_impl 100000001
example : specInRange 200000000 = inRange 200000000 := agree_spec_impl 200000000

end JapanTaxLaw.BatchRanged786dc912e
