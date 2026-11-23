import JapanTaxLaw.ServiceYearFractionRoundDown

/-!
# ServiceYearFractionRoundDown tests — 勤続年数端数切捨て smoke checks
Decidable smoke tests, pinned to law 347M50000040042 / revision 347M50000040042_20251231_507M60000040072.
一年未満切捨て: 11ヶ月→0年, 12ヶ月→1年, 23ヶ月→1年。
-/

namespace JapanTaxLaw.ServiceYearFractionRoundDown

example : roundDownToYear 11 = 0 := by decide
example : roundDownToYear 12 = 1 := by decide
example : roundDownToYear 23 = 1 := by decide
example : roundDownToYear 24 = 2 := by decide

end JapanTaxLaw.ServiceYearFractionRoundDown
