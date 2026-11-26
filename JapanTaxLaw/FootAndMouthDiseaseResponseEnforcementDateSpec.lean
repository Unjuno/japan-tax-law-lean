import JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate

/-!
# FootAndMouthDiseaseResponseEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 422CO0000000222, revision 422CO0000000222_20220401_502CO0000000207.
-/

namespace JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate

def specDate : Nat × Nat × Nat := (2022, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2022) || (d.1 == 2022 && decide (d.2.1 > 4)) ||
  (d.1 == 2022 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2022, 4, 1) = true := by decide
example : specInForce (2022, 3, 31) = false := by decide

def agreeFootAndMouthDiseaseResponseEnforcementDate : Bool :=
  [(2010,1,1),(2022,3,31),(2022,4,1),(2022,4,2),(2030,1,1)].all fun d => inForce d == specInForce d

example : agreeFootAndMouthDiseaseResponseEnforcementDate = true := by decide

end JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate
