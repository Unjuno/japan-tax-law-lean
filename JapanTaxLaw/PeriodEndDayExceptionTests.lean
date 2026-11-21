import JapanTaxLaw.PeriodEndDayException

/-!
# PeriodEndDayException tests — 土曜日 smoke checks
Decidable smoke tests, pinned to law 329CO0000000051 / revision 329CO0000000051_20260401_508CO0000000085.
土曜日 = 5（月=0..日=6）。
-/

namespace JapanTaxLaw.PeriodEndDayException

example : saturday = 5 := by decide

end JapanTaxLaw.PeriodEndDayException
