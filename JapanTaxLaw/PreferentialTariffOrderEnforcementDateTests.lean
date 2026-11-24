import JapanTaxLaw.PreferentialTariffOrderEnforcementDate

/-!
# PreferentialTariffOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 330CO0000000237 / revision 330CO0000000237_20250401_507CO0000000141.
平成17年=2005、施行日 2005-04-01。
-/

namespace JapanTaxLaw.PreferentialTariffOrderEnforcementDate

example : heiseiToSeireki 17 = 2005 := by decide
example : enforcementDate = (2005, 4, 1) := by decide
example : inForce (2005, 3, 31) = false := by decide
example : inForce (2005, 4, 1) = true := by decide

end JapanTaxLaw.PreferentialTariffOrderEnforcementDate
