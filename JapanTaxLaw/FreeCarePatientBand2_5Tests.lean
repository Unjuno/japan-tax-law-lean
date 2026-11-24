import JapanTaxLaw.FreeCarePatientBand2_5Spec

/-! Kernel-decided boundary examples: percent in [lo, hi). -/

namespace JapanTaxLaw.FreeCarePatientBand2_5Tests

open JapanTaxLaw.FreeCarePatientBand2_5
open JapanTaxLaw.FreeCarePatientBand2_5Spec

example : inBand 1 = false := by decide
example : inBand 2 = true := by decide
example : inBand 3 = true := by decide
example : inBand 4 = true := by decide
example : inBand 5 = false := by decide
example : inBand 6 = false := by decide
example : agree 2 := agree_thm 2
example : agree 4 := agree_thm 4

end JapanTaxLaw.FreeCarePatientBand2_5Tests
