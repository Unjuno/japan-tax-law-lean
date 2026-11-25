import JapanTaxLaw.BatchRange7e22efbba1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange7e22efbba1

example : lowerYen = 40000 := by decide
example : upperYen = 80000 := by decide
example : inRange 40000 = false := by decide
example : inRange 40001 = true := by decide
example : inRange 80000 = true := by decide
example : inRange 80001 = false := by decide
example : specInRange 40000 = inRange 40000 := agree_spec_impl 40000
example : specInRange 40001 = inRange 40001 := agree_spec_impl 40001
example : specInRange 80000 = inRange 80000 := agree_spec_impl 80000

end JapanTaxLaw.BatchRange7e22efbba1
