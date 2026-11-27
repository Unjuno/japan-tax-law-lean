import JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate

/-!
# SpecialCorporationBusinessTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 431CO0000000089 / revision 431CO0000000089_20240401_506CO0000000012.
平成31年=2019、施行日 2019-10-01。
-/

namespace JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate

example : heiseiToSeireki 31 = 2019 := by decide
example : enforcementDate = (2019, 10, 1) := by decide
example : inForce (2019, 9, 30) = false := by decide
example : inForce (2019, 10, 1) = true := by decide

end JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate
