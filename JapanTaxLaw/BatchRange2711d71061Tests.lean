import JapanTaxLaw.BatchRange2711d71061Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange2711d71061

example : lowerYen = 950000 := by decide
example : upperYen = 1300000 := by decide
example : inRange 950000 = false := by decide
example : inRange 950001 = true := by decide
example : inRange 1300000 = true := by decide
example : inRange 1300001 = false := by decide
example : specInRange 950000 = inRange 950000 := agree_spec_impl 950000
example : specInRange 950001 = inRange 950001 := agree_spec_impl 950001
example : specInRange 1300000 = inRange 1300000 := agree_spec_impl 1300000

end JapanTaxLaw.BatchRange2711d71061
