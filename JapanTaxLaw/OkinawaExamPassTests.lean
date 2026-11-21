import JapanTaxLaw.OkinawaExamPass

/-!
# OkinawaExamPass tests — 沖縄特例試験 合格基準 smoke checks
Decidable smoke tests, pinned to law 347M50000040044 / revision 347M50000040044_19740711_349M50000040044.
境界: 60/100, 40/100。
-/

namespace JapanTaxLaw.OkinawaExamPass

example : meetsTotalThreshold 100 60 = true := by decide
example : meetsTotalThreshold 100 59 = false := by decide
example : meetsTotalThreshold 1000 600 = true := by decide
example : belowSubjectFloor 100 40 = false := by decide
example : belowSubjectFloor 100 39 = true := by decide
example : belowSubjectFloor 100 0 = true := by decide

end JapanTaxLaw.OkinawaExamPass
