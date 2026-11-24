import JapanTaxLaw.BatchRange56780b6597Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange56780b6597

example : lowerYen = 6000000 := by decide
example : upperYen = 7500000 := by decide
example : inRange 6000000 = false := by decide
example : inRange 6000001 = true := by decide
example : inRange 7500000 = true := by decide
example : inRange 7500001 = false := by decide
example : specInRange 6000000 = inRange 6000000 := agree_spec_impl 6000000
example : specInRange 6000001 = inRange 6000001 := agree_spec_impl 6000001
example : specInRange 7500000 = inRange 7500000 := agree_spec_impl 7500000

end JapanTaxLaw.BatchRange56780b6597
