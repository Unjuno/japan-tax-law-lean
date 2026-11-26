import JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate

/-!
# ReconstructionSpecialCorporationTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 424M60000040007, revision 424M60000040007_20210415_503M60000040045.
-/

namespace JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate

def specDate : Nat × Nat × Nat := (2012, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2012) || (d.1 == 2012 && decide (d.2.1 > 4)) ||
  (d.1 == 2012 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2012, 4, 1) = true := by decide
example : specInForce (2012, 3, 31) = false := by decide

def agreeReconstructionSpecialCorporationTaxEnforcementDate : Bool :=
  [(1990,1,1),(2012,3,31),(2012,4,1),(2012,4,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeReconstructionSpecialCorporationTaxEnforcementDate = true := by decide

end JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate
