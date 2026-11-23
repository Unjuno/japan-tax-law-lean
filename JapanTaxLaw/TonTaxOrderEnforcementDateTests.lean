import JapanTaxLaw.TonTaxOrderEnforcementDate

/-!
# TonTaxOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 332CO0000000048 / revision 332CO0000000048_20201001_502CO0000000128.
昭和64年=1989、施行日 1989-04-01。
-/

namespace JapanTaxLaw.TonTaxOrderEnforcementDate

example : showaToSeireki 64 = 1989 := by decide
example : enforcementDate = (1989, 4, 1) := by decide
example : inForce (1989, 3, 31) = false := by decide
example : inForce (1989, 4, 1) = true := by decide

end JapanTaxLaw.TonTaxOrderEnforcementDate
