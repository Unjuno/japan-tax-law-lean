import JapanTaxLaw.TaxAccountantExamFeeScheduleSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.TaxAccountantExamFeeScheduleTests

open JapanTaxLaw.TaxAccountantExamFeeSchedule
open JapanTaxLaw.TaxAccountantExamFeeScheduleSpec

example : amount 0 = 4000 := by decide
example : agree 0 := agree_thm 0
example : amount 1 = 4000 := by decide
example : agree 1 := agree_thm 1
example : amount 2 = 5500 := by decide
example : agree 2 := agree_thm 2
example : amount 3 = 7000 := by decide
example : agree 3 := agree_thm 3

end JapanTaxLaw.TaxAccountantExamFeeScheduleTests
