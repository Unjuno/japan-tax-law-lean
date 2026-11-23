import JapanTaxLaw.PropertyInKindEnforcementDate

/-!
# PropertyInKindEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 325M50000040022 / revision 325M50000040022_20210401_503M60000040030.
平成15年=2003、施行日 2003-01-06。
-/

namespace JapanTaxLaw.PropertyInKindEnforcementDate

example : heiseiToSeireki 15 = 2003 := by decide
example : enforcementDate = (2003, 1, 6) := by decide
example : inForce (2003, 1, 5) = false := by decide
example : inForce (2003, 1, 6) = true := by decide

end JapanTaxLaw.PropertyInKindEnforcementDate
