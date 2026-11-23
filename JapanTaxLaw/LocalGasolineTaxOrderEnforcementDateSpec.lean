import JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate

/-!
# LocalGasolineTaxOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 330CO0000000151, revision 330CO0000000151_20241001_506CO0000000148.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate

def specDate : Nat × Nat × Nat := (1966, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1966) || (d.1 == 1966 && decide (d.2.1 > 4)) ||
  (d.1 == 1966 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1966, 4, 1) = true := by decide
example : specInForce (1966, 3, 31) = false := by decide

def agreeLocalGasolineTaxOrderEnforcementDate : Bool :=
  [(1960,1,1),(1966,3,31),(1966,4,1),(1966,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeLocalGasolineTaxOrderEnforcementDate = true := by decide

end JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate
