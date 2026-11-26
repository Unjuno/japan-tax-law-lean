import JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate

/-!
# FootAndMouthDiseaseResponseEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 422CO0000000222 / revision 422CO0000000222_20220401_502CO0000000207.
令和4年=2022、施行日 2022-04-01。
-/

namespace JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate

example : reiwaToSeireki 4 = 2022 := by decide
example : enforcementDate = (2022, 4, 1) := by decide
example : inForce (2022, 3, 31) = false := by decide
example : inForce (2022, 4, 1) = true := by decide

end JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate
