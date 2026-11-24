import JapanTaxLaw.BatchRange5c1c075b62Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange5c1c075b62

example : lowerYen = 6950000 := by decide
example : upperYen = 9000000 := by decide
example : inRange 6950000 = false := by decide
example : inRange 6950001 = true := by decide
example : inRange 9000000 = true := by decide
example : inRange 9000001 = false := by decide
example : specInRange 6950000 = inRange 6950000 := agree_spec_impl 6950000
example : specInRange 6950001 = inRange 6950001 := agree_spec_impl 6950001
example : specInRange 9000000 = inRange 9000000 := agree_spec_impl 9000000

end JapanTaxLaw.BatchRange5c1c075b62
