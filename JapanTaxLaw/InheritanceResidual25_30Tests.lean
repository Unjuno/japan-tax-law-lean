import JapanTaxLaw.InheritanceResidual25_30Spec

/-! Kernel-decided boundary examples: (lo, hi]. -/

namespace JapanTaxLaw.InheritanceResidual25_30Tests

open JapanTaxLaw.InheritanceResidual25_30
open JapanTaxLaw.InheritanceResidual25_30Spec

example : inBand 0 = false := by decide
example : inBand 25 = false := by decide
example : inBand 26 = true := by decide
example : inBand 30 = true := by decide
example : inBand 31 = false := by decide
example : specInBand 25 = false := by decide
example : specInBand 26 = true := by decide
example : specInBand 30 = true := by decide
example : specInBand 31 = false := by decide
example : agree 0 := agree_thm 0
example : agree 25 := agree_thm 25
example : agree 26 := agree_thm 26
example : agree 30 := agree_thm 30
example : agree 31 := agree_thm 31

end JapanTaxLaw.InheritanceResidual25_30Tests
