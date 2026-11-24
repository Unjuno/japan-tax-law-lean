import JapanTaxLaw.BatchRange61d76a299dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange61d76a299d

example : lowerYen = 15000 := by decide
example : upperYen = 40000 := by decide
example : inRange 15000 = false := by decide
example : inRange 15001 = true := by decide
example : inRange 40000 = true := by decide
example : inRange 40001 = false := by decide
example : specInRange 15000 = inRange 15000 := agree_spec_impl 15000
example : specInRange 15001 = inRange 15001 := agree_spec_impl 15001
example : specInRange 40000 = inRange 40000 := agree_spec_impl 40000

end JapanTaxLaw.BatchRange61d76a299d
