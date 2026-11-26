import JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate

/-!
# SofAgreementSpecialTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 327AC0000000113, revision 327AC0000000113_20260401_508AC0000000012.
-/

namespace JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate

def specDate : Nat × Nat × Nat := (1985, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1985) || (d.1 == 1985 && decide (d.2.1 > 4)) ||
  (d.1 == 1985 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1985, 4, 1) = true := by decide
example : specInForce (1985, 3, 31) = false := by decide

def agreeSofAgreementSpecialTaxEnforcementDate : Bool :=
  [(1980,1,1),(1985,3,31),(1985,4,1),(1985,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeSofAgreementSpecialTaxEnforcementDate = true := by decide

end JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate
