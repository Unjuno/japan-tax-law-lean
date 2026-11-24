import JapanTaxLaw.BatchRange4d1c89471cSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange4d1c89471c

example : lowerYen = 1320000 := by decide
example : upperYen = 3360000 := by decide
example : inRange 1320000 = false := by decide
example : inRange 1320001 = true := by decide
example : inRange 3360000 = true := by decide
example : inRange 3360001 = false := by decide
example : specInRange 1320000 = inRange 1320000 := agree_spec_impl 1320000
example : specInRange 1320001 = inRange 1320001 := agree_spec_impl 1320001
example : specInRange 3360000 = inRange 3360000 := agree_spec_impl 3360000

end JapanTaxLaw.BatchRange4d1c89471c
