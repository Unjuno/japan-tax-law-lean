import JapanTaxLaw.NonUniformRateCap

/-!
# NonUniformRateCap tests — 税率上限 smoke checks
Decidable smoke tests, pinned to law 505M60000008043 / revision 505M60000008043_20240426_506M60000008046.
上限50: 30→30, 50→50, 80→50。
-/

namespace JapanTaxLaw.NonUniformRateCap

example : rateCapPerThousand = 50 := by decide
example : cappedRate 0 = 0 := by decide
example : cappedRate 30 = 30 := by decide
example : cappedRate 50 = 50 := by decide
example : cappedRate 80 = 50 := by decide

end JapanTaxLaw.NonUniformRateCap
