import JapanTaxLaw.MutualDefenseAidAgreementEnforcementDate

/-!
# MutualDefenseAidAgreementEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 327AC0000000113, revision 329CO0000000103_20250401_507CO0000000006.
-/

namespace JapanTaxLaw.MutualDefenseAidAgreementEnforcementDate

def specDate : Nat × Nat × Nat := (1989, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1989) || (d.1 == 1989 && decide (d.2.1 > 4)) ||
  (d.1 == 1989 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1989, 4, 1) = true := by decide
example : specInForce (1989, 3, 31) = false := by decide

def agreeMutualDefenseAidAgreementEnforcementDate : Bool :=
  [(1980,1,1),(1989,3,31),(1989,4,1),(1989,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeMutualDefenseAidAgreementEnforcementDate = true := by decide

end JapanTaxLaw.MutualDefenseAidAgreementEnforcementDate
