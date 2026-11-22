import JapanTaxLaw.PaymentDeadline

/-!
# PaymentDeadline tests — 納付期限 smoke checks
Decidable smoke tests, pinned to law 329M50000040039 / revision 329M50000040039_20260924_508M60000040059.
境界: 19→true / 20→true / 21→false。
-/

namespace JapanTaxLaw.PaymentDeadline

example : maxDaysAfterDecision = 20 := by decide
example : isWithinDeadline 0 = true := by decide
example : isWithinDeadline 19 = true := by decide
example : isWithinDeadline 20 = true := by decide
example : isWithinDeadline 21 = false := by decide

end JapanTaxLaw.PaymentDeadline
