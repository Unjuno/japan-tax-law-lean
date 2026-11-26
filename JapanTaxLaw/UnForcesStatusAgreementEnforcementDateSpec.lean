import JapanTaxLaw.UnForcesStatusAgreementEnforcementDate

/-!
# UnForcesStatusAgreementEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 329AC0000000188, revision 329AC0000000188_20260401_508AC0000000002.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.UnForcesStatusAgreementEnforcementDate

def specDate : Nat × Nat × Nat := (1960, 7, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1960) || (d.1 == 1960 && decide (d.2.1 > 7)) ||
  (d.1 == 1960 && d.2.1 == 7 && decide (d.2.2 >= 1))

example : specInForce (1960, 7, 1) = true := by decide
example : specInForce (1960, 6, 30) = false := by decide

def agreeUnForcesStatusAgreementEnforcementDate : Bool :=
  [(1950,1,1),(1960,6,30),(1960,7,1),(1960,7,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeUnForcesStatusAgreementEnforcementDate = true := by decide

end JapanTaxLaw.UnForcesStatusAgreementEnforcementDate
