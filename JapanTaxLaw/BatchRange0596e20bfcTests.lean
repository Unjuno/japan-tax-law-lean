import JapanTaxLaw.BatchRange0596e20bfcSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRange0596e20bfc

example : lowerYen = 3000000 := by decide
example : upperYen = 4000000 := by decide
example : inRange 3000000 = false := by decide
example : inRange 3000001 = true := by decide
example : inRange 4000000 = true := by decide
example : inRange 4000001 = false := by decide
example : specInRange 3000000 = inRange 3000000 := agree_spec_impl 3000000
example : specInRange 3000001 = inRange 3000001 := agree_spec_impl 3000001
example : specInRange 4000000 = inRange 4000000 := agree_spec_impl 4000000

end JapanTaxLaw.BatchRange0596e20bfc
