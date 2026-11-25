import JapanTaxLaw.BatchRangef83029073fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangef83029073f

example : lowerYen = 23500000 := by decide
example : upperYen = 24000000 := by decide
example : inRange 23500000 = false := by decide
example : inRange 23500001 = true := by decide
example : inRange 24000000 = true := by decide
example : inRange 24000001 = false := by decide
example : specInRange 23500000 = inRange 23500000 := agree_spec_impl 23500000
example : specInRange 23500001 = inRange 23500001 := agree_spec_impl 23500001
example : specInRange 24000000 = inRange 24000000 := agree_spec_impl 24000000

end JapanTaxLaw.BatchRangef83029073f
