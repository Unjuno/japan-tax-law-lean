import JapanTaxLaw.BatchRange53d50419b1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange53d50419b1

example : lowerYen = 500000 := by decide
example : upperYen = 1000000 := by decide
example : inRange 500000 = false := by decide
example : inRange 500001 = true := by decide
example : inRange 1000000 = true := by decide
example : inRange 1000001 = false := by decide
example : specInRange 500000 = inRange 500000 := agree_spec_impl 500000
example : specInRange 500001 = inRange 500001 := agree_spec_impl 500001
example : specInRange 1000000 = inRange 1000000 := agree_spec_impl 1000000

end JapanTaxLaw.BatchRange53d50419b1
