import JapanTaxLaw.BatchRange04f3acb913Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange04f3acb913

example : lowerYen = 7500000 := by decide
example : upperYen = 10000000 := by decide
example : inRange 7500000 = false := by decide
example : inRange 7500001 = true := by decide
example : inRange 10000000 = true := by decide
example : inRange 10000001 = false := by decide
example : specInRange 7500000 = inRange 7500000 := agree_spec_impl 7500000
example : specInRange 7500001 = inRange 7500001 := agree_spec_impl 7500001
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000

end JapanTaxLaw.BatchRange04f3acb913
