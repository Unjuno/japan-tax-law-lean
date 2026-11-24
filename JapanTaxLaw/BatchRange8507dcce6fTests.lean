import JapanTaxLaw.BatchRange8507dcce6fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange8507dcce6f

example : lowerYen = 1000000000 := by decide
example : upperYen = 5000000000 := by decide
example : inRange 1000000000 = false := by decide
example : inRange 1000000001 = true := by decide
example : inRange 5000000000 = true := by decide
example : inRange 5000000001 = false := by decide
example : specInRange 1000000000 = inRange 1000000000 := agree_spec_impl 1000000000
example : specInRange 1000000001 = inRange 1000000001 := agree_spec_impl 1000000001
example : specInRange 5000000000 = inRange 5000000000 := agree_spec_impl 5000000000

end JapanTaxLaw.BatchRange8507dcce6f
