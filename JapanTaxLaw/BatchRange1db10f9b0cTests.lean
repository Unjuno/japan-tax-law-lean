import JapanTaxLaw.BatchRange1db10f9b0cSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange1db10f9b0c

example : lowerYen = 20000 := by decide
example : upperYen = 40000 := by decide
example : inRange 20000 = false := by decide
example : inRange 20001 = true := by decide
example : inRange 40000 = true := by decide
example : inRange 40001 = false := by decide
example : specInRange 20000 = inRange 20000 := agree_spec_impl 20000
example : specInRange 20001 = inRange 20001 := agree_spec_impl 20001
example : specInRange 40000 = inRange 40000 := agree_spec_impl 40000

end JapanTaxLaw.BatchRange1db10f9b0c
