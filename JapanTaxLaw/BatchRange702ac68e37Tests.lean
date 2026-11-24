import JapanTaxLaw.BatchRange702ac68e37Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange702ac68e37

example : lowerYen = 500000 := by decide
example : upperYen = 3000000 := by decide
example : inRange 500000 = false := by decide
example : inRange 500001 = true := by decide
example : inRange 3000000 = true := by decide
example : inRange 3000001 = false := by decide
example : specInRange 500000 = inRange 500000 := agree_spec_impl 500000
example : specInRange 500001 = inRange 500001 := agree_spec_impl 500001
example : specInRange 3000000 = inRange 3000000 := agree_spec_impl 3000000

end JapanTaxLaw.BatchRange702ac68e37
