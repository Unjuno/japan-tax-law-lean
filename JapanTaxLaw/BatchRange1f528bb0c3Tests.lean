import JapanTaxLaw.BatchRange1f528bb0c3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange1f528bb0c3

example : lowerYen = 24500000 := by decide
example : upperYen = 25000000 := by decide
example : inRange 24500000 = false := by decide
example : inRange 24500001 = true := by decide
example : inRange 25000000 = true := by decide
example : inRange 25000001 = false := by decide
example : specInRange 24500000 = inRange 24500000 := agree_spec_impl 24500000
example : specInRange 24500001 = inRange 24500001 := agree_spec_impl 24500001
example : specInRange 25000000 = inRange 25000000 := agree_spec_impl 25000000

end JapanTaxLaw.BatchRange1f528bb0c3
