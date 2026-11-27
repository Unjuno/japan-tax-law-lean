import JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate

/-!
# ReconstructionZoneLocalTaxExemptionEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 423M60000008168 / revision 423M60000008168_20260401_508M60000008052.
平成29年=2017、施行日 2017-04-01。
-/

namespace JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate

example : heiseiToSeireki 29 = 2017 := by decide
example : enforcementDate = (2017, 4, 1) := by decide
example : inForce (2017, 3, 31) = false := by decide
example : inForce (2017, 4, 1) = true := by decide

end JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate
