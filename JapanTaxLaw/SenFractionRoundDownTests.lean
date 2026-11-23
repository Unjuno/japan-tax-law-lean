import JapanTaxLaw.SenFractionRoundDown

/-!
# SenFractionRoundDown tests — 一銭未満切捨て smoke checks
Decidable smoke tests, pinned to law 360M50000040001 / revision 360M50000040001_20240401_506M60000040021.
一銭未満切り捨て: 0.9銭→0, 1.5銭→1銭。
-/

namespace JapanTaxLaw.SenFractionRoundDown

example : roundDownToSen 9 = 0 := by decide
example : roundDownToSen 10 = 10 := by decide
example : roundDownToSen 15 = 10 := by decide

end JapanTaxLaw.SenFractionRoundDown
