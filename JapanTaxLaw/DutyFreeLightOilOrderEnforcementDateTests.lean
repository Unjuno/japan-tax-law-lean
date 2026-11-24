import JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate

/-!
# DutyFreeLightOilOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 331M50000002047 / revision 331M50000002047_20090401_421M60000008036.
平成元年=1989、施行日 1989-10-01。
-/

namespace JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate

example : heiseiToSeireki 1 = 1989 := by decide
example : enforcementDate = (1989, 10, 1) := by decide
example : inForce (1989, 9, 30) = false := by decide
example : inForce (1989, 10, 1) = true := by decide

end JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate
