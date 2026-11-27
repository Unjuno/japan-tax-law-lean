import JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate

/-!
# ReconstructionZoneLocalTaxExemptionEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 423M60000008168, revision 423M60000008168_20260401_508M60000008052.
-/

namespace JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate

def specDate : Nat × Nat × Nat := (2017, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2017) || (d.1 == 2017 && decide (d.2.1 > 4)) ||
  (d.1 == 2017 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2017, 4, 1) = true := by decide
example : specInForce (2017, 3, 31) = false := by decide

def agreeReconstructionZoneLocalTaxExemptionEnforcementDate : Bool :=
  [(1990,1,1),(2017,3,31),(2017,4,1),(2017,4,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeReconstructionZoneLocalTaxExemptionEnforcementDate = true := by decide

end JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate
