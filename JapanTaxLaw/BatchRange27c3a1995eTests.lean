import JapanTaxLaw.BatchRange27c3a1995eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange27c3a1995e

example : lowerYen = 40000 := by decide
example : upperYen = 70000 := by decide
example : inRange 40000 = false := by decide
example : inRange 40001 = true := by decide
example : inRange 70000 = true := by decide
example : inRange 70001 = false := by decide
example : specInRange 40000 = inRange 40000 := agree_spec_impl 40000
example : specInRange 40001 = inRange 40001 := agree_spec_impl 40001
example : specInRange 70000 = inRange 70000 := agree_spec_impl 70000

end JapanTaxLaw.BatchRange27c3a1995e
