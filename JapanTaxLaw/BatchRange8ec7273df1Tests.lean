import JapanTaxLaw.BatchRange8ec7273df1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange8ec7273df1

example : lowerYen = 24000000 := by decide
example : upperYen = 24500000 := by decide
example : inRange 24000000 = false := by decide
example : inRange 24000001 = true := by decide
example : inRange 24500000 = true := by decide
example : inRange 24500001 = false := by decide
example : specInRange 24000000 = inRange 24000000 := agree_spec_impl 24000000
example : specInRange 24000001 = inRange 24000001 := agree_spec_impl 24000001
example : specInRange 24500000 = inRange 24500000 := agree_spec_impl 24500000

end JapanTaxLaw.BatchRange8ec7273df1
