import JapanTaxLaw.TaxNoticeDeadline

/-!
# TaxNoticeDeadline tests — 納税通知書期限 smoke checks
Decidable smoke tests, pinned to law 327AC0000000119 / revision 327AC0000000119_20260401_508AC0000000002.
境界: 9→false / 10→true / 11→true。
-/

namespace JapanTaxLaw.TaxNoticeDeadline

example : noticeLeadDays = 10 := by decide
example : meetsNoticeDeadline 0 = false := by decide
example : meetsNoticeDeadline 9 = false := by decide
example : meetsNoticeDeadline 10 = true := by decide
example : meetsNoticeDeadline 11 = true := by decide

end JapanTaxLaw.TaxNoticeDeadline
