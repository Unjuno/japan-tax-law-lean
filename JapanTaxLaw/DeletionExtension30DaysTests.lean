import JapanTaxLaw.DeletionExtension30DaysSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.DeletionExtension30DaysTests

open JapanTaxLaw.DeletionExtension30Days
open JapanTaxLaw.DeletionExtension30DaysSpec

example : allowed 29 = true := by decide
example : allowed 30 = true := by decide
example : allowed 31 = false := by decide
example : agree 29 := agree_thm 29
example : agree 30 := agree_thm 30

end JapanTaxLaw.DeletionExtension30DaysTests
