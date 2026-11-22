import JapanTaxLaw.FiscalPeriodLength

/-!
# FiscalPeriodLength tests — 5箇年度 smoke checks
Decidable smoke tests, pinned to law 405M50000008001 / revision 405M50000008001_20250401_507M60000008028.
0(期間前)→false、1..5→true、6(期間後)→false。
-/

namespace JapanTaxLaw.FiscalPeriodLength

example : periodYears = 5 := by decide
example : isInPeriod 0 = false := by decide
example : isInPeriod 1 = true := by decide
example : isInPeriod 5 = true := by decide
example : isInPeriod 6 = false := by decide

end JapanTaxLaw.FiscalPeriodLength
