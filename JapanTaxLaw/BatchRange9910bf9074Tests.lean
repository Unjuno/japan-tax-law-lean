import JapanTaxLaw.BatchRange9910bf9074Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange9910bf9074

example : lowerYen = 25000 := by decide
example : upperYen = 50000 := by decide
example : inRange 25000 = false := by decide
example : inRange 25001 = true := by decide
example : inRange 50000 = true := by decide
example : inRange 50001 = false := by decide
example : specInRange 25000 = inRange 25000 := agree_spec_impl 25000
example : specInRange 25001 = inRange 25001 := agree_spec_impl 25001
example : specInRange 50000 = inRange 50000 := agree_spec_impl 50000

end JapanTaxLaw.BatchRange9910bf9074
