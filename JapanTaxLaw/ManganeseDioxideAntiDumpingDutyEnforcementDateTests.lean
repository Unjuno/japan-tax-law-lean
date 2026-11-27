import JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate

/-!
# ManganeseDioxideAntiDumpingDutyEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 420CO0000000196 / revision 420CO0000000196_20240301_506CO0000000039.
平成23年=2011、施行日 2011-04-01。
-/

namespace JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate

example : heiseiToSeireki 23 = 2011 := by decide
example : enforcementDate = (2011, 4, 1) := by decide
example : inForce (2011, 3, 31) = false := by decide
example : inForce (2011, 4, 1) = true := by decide

end JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate
