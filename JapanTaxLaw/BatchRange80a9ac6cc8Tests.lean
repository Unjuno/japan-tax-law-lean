import JapanTaxLaw.BatchRange80a9ac6cc8Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange80a9ac6cc8

example : lowerYen = 9500000 := by decide
example : upperYen = 10000000 := by decide
example : inRange 9500000 = false := by decide
example : inRange 9500001 = true := by decide
example : inRange 10000000 = true := by decide
example : inRange 10000001 = false := by decide
example : specInRange 9500000 = inRange 9500000 := agree_spec_impl 9500000
example : specInRange 9500001 = inRange 9500001 := agree_spec_impl 9500001
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000

end JapanTaxLaw.BatchRange80a9ac6cc8
