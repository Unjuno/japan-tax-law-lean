import JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate

/-!
# HanshinAwajiDisasterTaxReliefEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 407M50000040012 / revision 407M50000040012_20090401_421M60000040020.
平成14年=2002、施行日 2002-08-01。
-/

namespace JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate

example : heiseiToSeireki 14 = 2002 := by decide
example : enforcementDate = (2002, 8, 1) := by decide
example : inForce (2002, 7, 31) = false := by decide
example : inForce (2002, 8, 1) = true := by decide

end JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate
