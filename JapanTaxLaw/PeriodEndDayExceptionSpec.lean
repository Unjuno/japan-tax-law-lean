import JapanTaxLaw.PeriodEndDayException

/-!
# PeriodEndDayException spec — 土曜日 の独立定式
Sources (pinned): law 329CO0000000051, revision 329CO0000000051_20260401_508CO0000000085.
Independent restatement: 政令で定める日 = 土曜日 = 5（列挙）。
-/

namespace JapanTaxLaw.PeriodEndDayException

def specSaturday : Nat := 5

example : specSaturday = 5 := by decide

def agreePeriodEndDayException : Bool := saturday == specSaturday

example : agreePeriodEndDayException = true := by decide

end JapanTaxLaw.PeriodEndDayException
