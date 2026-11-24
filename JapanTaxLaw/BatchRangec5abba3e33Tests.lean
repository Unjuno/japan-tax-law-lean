import JapanTaxLaw.BatchRangec5abba3e33Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRangec5abba3e33

example : lowerYen = 32000 := by decide
example : upperYen = 56000 := by decide
example : inRange 32000 = false := by decide
example : inRange 32001 = true := by decide
example : inRange 56000 = true := by decide
example : inRange 56001 = false := by decide
example : specInRange 32000 = inRange 32000 := agree_spec_impl 32000
example : specInRange 32001 = inRange 32001 := agree_spec_impl 32001
example : specInRange 56000 = inRange 56000 := agree_spec_impl 56000

end JapanTaxLaw.BatchRangec5abba3e33
