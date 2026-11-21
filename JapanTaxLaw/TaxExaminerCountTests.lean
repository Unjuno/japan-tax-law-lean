import JapanTaxLaw.TaxExaminerCount

/-!
# TaxExaminerCount tests — 国税審査官定数 smoke checks
Decidable smoke tests, pinned to law 345M50000040017 / revision 345M50000040017_20260710_508M60000040048.
境界: 173→true / 174→true / 175→false。
-/

namespace JapanTaxLaw.TaxExaminerCount

example : maxExaminers = 174 := by decide
example : isWithinCap 0 = true := by decide
example : isWithinCap 173 = true := by decide
example : isWithinCap 174 = true := by decide
example : isWithinCap 175 = false := by decide

end JapanTaxLaw.TaxExaminerCount
