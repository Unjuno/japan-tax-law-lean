import JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate

/-!
# LocalGasolineGrantTaxOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 344CO0000000088, revision 344CO0000000088_20090401_421CO0000000100.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate

def specDate : Nat × Nat × Nat := (1976, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1976) || (d.1 == 1976 && decide (d.2.1 > 4)) ||
  (d.1 == 1976 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1976, 4, 1) = true := by decide
example : specInForce (1976, 3, 31) = false := by decide

def agreeLocalGasolineGrantTaxOrderEnforcementDate : Bool :=
  [(1970,1,1),(1976,3,31),(1976,4,1),(1976,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeLocalGasolineGrantTaxOrderEnforcementDate = true := by decide

end JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate
