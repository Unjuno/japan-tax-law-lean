import JapanTaxLaw.CourseHoursThresholdSpec

/-! Kernel-decided boundary examples for 法人税法施行規則 art. 7 (60 hours). -/

namespace JapanTaxLaw.CourseHoursThresholdTests

open JapanTaxLaw.CourseHoursThreshold
open JapanTaxLaw.CourseHoursThresholdSpec

example : meetsAnnualHours 0 = false := by decide
example : meetsAnnualHours 59 = false := by decide
example : meetsAnnualHours 60 = true := by decide
example : meetsAnnualHours 61 = true := by decide
example : specMeets 59 = false := by decide
example : specMeets 60 = true := by decide
example : agreeMeets 0 := agree_meets 0
example : agreeMeets 59 := agree_meets 59
example : agreeMeets 60 := agree_meets 60
example : agreeMeets 61 := agree_meets 61

end JapanTaxLaw.CourseHoursThresholdTests
