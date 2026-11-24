import JapanTaxLaw.ClinicHours4622Spec

/-! Kernel-decided boundary examples: 0/4621/4622/4623 h. -/

namespace JapanTaxLaw.ClinicHours4622Tests

open JapanTaxLaw.ClinicHours4622
open JapanTaxLaw.ClinicHours4622Spec

example : hasClinicHours4622 0 = false := by decide
example : hasClinicHours4622 4621 = false := by decide
example : hasClinicHours4622 4622 = true := by decide
example : hasClinicHours4622 4623 = true := by decide
example : specWithin 4621 = false := by decide
example : specWithin 4622 = true := by decide
example : specWithin 4623 = true := by decide
example : agree 0 := agree_thm 0
example : agree 4621 := agree_thm 4621
example : agree 4622 := agree_thm 4622
example : agree 4623 := agree_thm 4623

end JapanTaxLaw.ClinicHours4622Tests
