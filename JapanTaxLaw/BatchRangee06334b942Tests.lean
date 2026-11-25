import JapanTaxLaw.BatchRangee06334b942Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangee06334b942

example : lowerYen = 1950000 := by decide
example : upperYen = 3300000 := by decide
example : inRange 1950000 = false := by decide
example : inRange 1950001 = true := by decide
example : inRange 3300000 = true := by decide
example : inRange 3300001 = false := by decide
example : specInRange 1950000 = inRange 1950000 := agree_spec_impl 1950000
example : specInRange 1950001 = inRange 1950001 := agree_spec_impl 1950001
example : specInRange 3300000 = inRange 3300000 := agree_spec_impl 3300000

end JapanTaxLaw.BatchRangee06334b942
