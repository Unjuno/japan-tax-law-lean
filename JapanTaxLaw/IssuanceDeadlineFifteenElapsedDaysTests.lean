import JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays
import JapanTaxLaw.IssuanceDeadlineFifteenElapsedDaysSpec

/-
# IssuanceDeadlineFifteenElapsedDaysTests — 関税暫定措置法証明書発給省令 2(4) の kernel-decided 検証

Pinned: law 407M50000200018 / revision 407M50000200018_20201221_502M60000200083.
Closed expressions discharged by `by decide`.
Coverage: zero/small inputs, the 15-elapsed-day boundary (L-1/L/L+1),
shifted acceptance days and impl/spec agreement.
-/

namespace JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays

example : elapsedDays = 15 := by decide

-- 零入力・小さい入力
example : byDeadline 0 0 = true := by decide
example : byDeadline 0 1 = true := by decide
example : byDeadline 0 2 = true := by decide

-- 境界: 15 経過日 (L-1 / L / L+1)
example : byDeadline 0 14 = true := by decide
example : byDeadline 0 15 = true := by decide
example : byDeadline 0 16 = false := by decide

-- 受理日のシフト
example : byDeadline 10 24 = true := by decide
example : byDeadline 10 25 = true := by decide
example : byDeadline 10 26 = false := by decide

-- impl / 独立仕様の一致
example : elapsedDays = specElapsed := by decide
example : byDeadline 0 0 = specByDeadline 0 0 := by decide
example : byDeadline 0 14 = specByDeadline 0 14 := by decide
example : byDeadline 0 15 = specByDeadline 0 15 := by decide
example : byDeadline 0 16 = specByDeadline 0 16 := by decide
example : byDeadline 10 25 = specByDeadline 10 25 := by decide
example : byDeadline 10 26 = specByDeadline 10 26 := by decide

end JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays
