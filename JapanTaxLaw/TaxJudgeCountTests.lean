import JapanTaxLaw.TaxJudgeCount

/-!
# TaxJudgeCount tests — 国税審判官定数 smoke checks
Decidable smoke tests, pinned to law 345M50000040017 / revision 345M50000040017_20260710_508M60000040048.
定員 180 / 89。
-/

namespace JapanTaxLaw.TaxJudgeCount

example : judgeCount = 180 := by decide
example : deputyJudgeCount = 89 := by decide
example : judgeCount > deputyJudgeCount := by decide

end JapanTaxLaw.TaxJudgeCount
