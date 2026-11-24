import JapanTaxLaw.BatchRange72627cdea2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange72627cdea2

example : lowerYen = 950000 := by decide
example : upperYen = 1150000 := by decide
example : inRange 950000 = false := by decide
example : inRange 950001 = true := by decide
example : inRange 1150000 = true := by decide
example : inRange 1150001 = false := by decide
example : specInRange 950000 = inRange 950000 := agree_spec_impl 950000
example : specInRange 950001 = inRange 950001 := agree_spec_impl 950001
example : specInRange 1150000 = inRange 1150000 := agree_spec_impl 1150000

end JapanTaxLaw.BatchRange72627cdea2
