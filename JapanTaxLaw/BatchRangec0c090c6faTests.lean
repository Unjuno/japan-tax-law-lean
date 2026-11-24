import JapanTaxLaw.BatchRangec0c090c6faSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangec0c090c6fa

example : lowerYen = 3360000 := by decide
example : upperYen = 4890000 := by decide
example : inRange 3360000 = false := by decide
example : inRange 3360001 = true := by decide
example : inRange 4890000 = true := by decide
example : inRange 4890001 = false := by decide
example : specInRange 3360000 = inRange 3360000 := agree_spec_impl 3360000
example : specInRange 3360001 = inRange 3360001 := agree_spec_impl 3360001
example : specInRange 4890000 = inRange 4890000 := agree_spec_impl 4890000

end JapanTaxLaw.BatchRangec0c090c6fa
