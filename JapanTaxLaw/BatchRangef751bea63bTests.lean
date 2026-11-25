import JapanTaxLaw.BatchRangef751bea63bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangef751bea63b

example : lowerYen = 50000 := by decide
example : upperYen = 100000 := by decide
example : inRange 50000 = false := by decide
example : inRange 50001 = true := by decide
example : inRange 100000 = true := by decide
example : inRange 100001 = false := by decide
example : specInRange 50000 = inRange 50000 := agree_spec_impl 50000
example : specInRange 50001 = inRange 50001 := agree_spec_impl 50001
example : specInRange 100000 = inRange 100000 := agree_spec_impl 100000

end JapanTaxLaw.BatchRangef751bea63b
