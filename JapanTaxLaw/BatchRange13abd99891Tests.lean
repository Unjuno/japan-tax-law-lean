import JapanTaxLaw.BatchRange13abd99891Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange13abd99891

example : lowerYen = 100000 := by decide
example : upperYen = 500000 := by decide
example : inRange 100000 = false := by decide
example : inRange 100001 = true := by decide
example : inRange 500000 = true := by decide
example : inRange 500001 = false := by decide
example : specInRange 100000 = inRange 100000 := agree_spec_impl 100000
example : specInRange 100001 = inRange 100001 := agree_spec_impl 100001
example : specInRange 500000 = inRange 500000 := agree_spec_impl 500000

end JapanTaxLaw.BatchRange13abd99891
