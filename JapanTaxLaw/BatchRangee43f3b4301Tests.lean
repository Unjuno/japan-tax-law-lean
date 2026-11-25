import JapanTaxLaw.BatchRangee43f3b4301Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangee43f3b4301

example : lowerYen = 18000000 := by decide
example : upperYen = 40000000 := by decide
example : inRange 18000000 = false := by decide
example : inRange 18000001 = true := by decide
example : inRange 40000000 = true := by decide
example : inRange 40000001 = false := by decide
example : specInRange 18000000 = inRange 18000000 := agree_spec_impl 18000000
example : specInRange 18000001 = inRange 18000001 := agree_spec_impl 18000001
example : specInRange 40000000 = inRange 40000000 := agree_spec_impl 40000000

end JapanTaxLaw.BatchRangee43f3b4301
