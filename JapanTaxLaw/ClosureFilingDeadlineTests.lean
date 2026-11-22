import JapanTaxLaw.ClosureFilingDeadline

/-!
# ClosureFilingDeadline tests — 廃止届出期限 smoke checks
Decidable smoke tests, pinned to law 346M50000040057 / revision 346M50000040057_20120401_424M60000040035.
境界: 29→false / 30→true / 31→true。
-/

namespace JapanTaxLaw.ClosureFilingDeadline

example : noticeDays = 30 := by decide
example : meetsDeadline 0 = false := by decide
example : meetsDeadline 29 = false := by decide
example : meetsDeadline 30 = true := by decide
example : meetsDeadline 31 = true := by decide

end JapanTaxLaw.ClosureFilingDeadline
