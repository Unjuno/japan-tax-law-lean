import JapanTaxLaw.BatchRangef1e089958fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangef1e089958f

example : lowerYen = 500000000 := by decide
example : upperYen = 1000000000 := by decide
example : inRange 500000000 = false := by decide
example : inRange 500000001 = true := by decide
example : inRange 1000000000 = true := by decide
example : inRange 1000000001 = false := by decide
example : specInRange 500000000 = inRange 500000000 := agree_spec_impl 500000000
example : specInRange 500000001 = inRange 500000001 := agree_spec_impl 500000001
example : specInRange 1000000000 = inRange 1000000000 := agree_spec_impl 1000000000

end JapanTaxLaw.BatchRangef1e089958f
