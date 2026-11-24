import JapanTaxLaw.BatchRange315cc15e8bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange315cc15e8b

example : lowerYen = 3600000 := by decide
example : upperYen = 7200000 := by decide
example : inRange 3600000 = false := by decide
example : inRange 3600001 = true := by decide
example : inRange 7200000 = true := by decide
example : inRange 7200001 = false := by decide
example : specInRange 3600000 = inRange 3600000 := agree_spec_impl 3600000
example : specInRange 3600001 = inRange 3600001 := agree_spec_impl 3600001
example : specInRange 7200000 = inRange 7200000 := agree_spec_impl 7200000

end JapanTaxLaw.BatchRange315cc15e8b
