import JapanTaxLaw.BatchRange4e8bd901d7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange4e8bd901d7

example : lowerYen = 12000 := by decide
example : upperYen = 32000 := by decide
example : inRange 12000 = false := by decide
example : inRange 12001 = true := by decide
example : inRange 32000 = true := by decide
example : inRange 32001 = false := by decide
example : specInRange 12000 = inRange 12000 := agree_spec_impl 12000
example : specInRange 12001 = inRange 12001 := agree_spec_impl 12001
example : specInRange 32000 = inRange 32000 := agree_spec_impl 32000

end JapanTaxLaw.BatchRange4e8bd901d7
