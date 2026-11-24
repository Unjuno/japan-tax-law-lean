import JapanTaxLaw.FreeCarePatientBand5_10Spec

/-! Kernel-decided boundary examples: percent in [lo, hi). -/

namespace JapanTaxLaw.FreeCarePatientBand5_10Tests

open JapanTaxLaw.FreeCarePatientBand5_10
open JapanTaxLaw.FreeCarePatientBand5_10Spec

example : inBand 4 = false := by decide
example : inBand 5 = true := by decide
example : inBand 6 = true := by decide
example : inBand 9 = true := by decide
example : inBand 10 = false := by decide
example : inBand 11 = false := by decide
example : agree 5 := agree_thm 5
example : agree 9 := agree_thm 9

end JapanTaxLaw.FreeCarePatientBand5_10Tests
