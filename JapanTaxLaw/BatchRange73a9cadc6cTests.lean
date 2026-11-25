import JapanTaxLaw.BatchRange73a9cadc6cSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange73a9cadc6c

example : lowerYen = 850000 := by decide
example : upperYen = 1150000 := by decide
example : inRange 850000 = false := by decide
example : inRange 850001 = true := by decide
example : inRange 1150000 = true := by decide
example : inRange 1150001 = false := by decide
example : specInRange 850000 = inRange 850000 := agree_spec_impl 850000
example : specInRange 850001 = inRange 850001 := agree_spec_impl 850001
example : specInRange 1150000 = inRange 1150000 := agree_spec_impl 1150000

end JapanTaxLaw.BatchRange73a9cadc6c
