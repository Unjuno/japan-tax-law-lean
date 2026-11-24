import JapanTaxLaw.TrialPeriod14DaysSpec

/-! Kernel-decided boundary examples: 0/13/14/15 日. -/

namespace JapanTaxLaw.TrialPeriod14DaysTests

open JapanTaxLaw.TrialPeriod14Days
open JapanTaxLaw.TrialPeriod14DaysSpec

example : exceedsTrial14 0 = false := by decide
example : exceedsTrial14 13 = false := by decide
example : exceedsTrial14 14 = false := by decide
example : exceedsTrial14 15 = true := by decide
example : specWithin 13 = false := by decide
example : specWithin 14 = false := by decide
example : specWithin 15 = true := by decide
example : agree 0 := agree_thm 0
example : agree 13 := agree_thm 13
example : agree 14 := agree_thm 14
example : agree 15 := agree_thm 15

end JapanTaxLaw.TrialPeriod14DaysTests
