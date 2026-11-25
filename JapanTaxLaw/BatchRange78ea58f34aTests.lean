import JapanTaxLaw.BatchRange78ea58f34aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange78ea58f34a

example : lowerYen = 10000000 := by decide
example : upperYen = 20000000 := by decide
example : inRange 10000000 = false := by decide
example : inRange 10000001 = true := by decide
example : inRange 20000000 = true := by decide
example : inRange 20000001 = false := by decide
example : specInRange 10000000 = inRange 10000000 := agree_spec_impl 10000000
example : specInRange 10000001 = inRange 10000001 := agree_spec_impl 10000001
example : specInRange 20000000 = inRange 20000000 := agree_spec_impl 20000000

end JapanTaxLaw.BatchRange78ea58f34a
