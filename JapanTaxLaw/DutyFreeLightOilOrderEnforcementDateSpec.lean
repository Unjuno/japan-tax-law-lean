import JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate

/-!
# DutyFreeLightOilOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 331M50000002047, revision 331M50000002047_20090401_421M60000008036.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate

def specDate : Nat × Nat × Nat := (1989, 10, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1989) || (d.1 == 1989 && decide (d.2.1 > 10)) ||
  (d.1 == 1989 && d.2.1 == 10 && decide (d.2.2 >= 1))

example : specInForce (1989, 10, 1) = true := by decide
example : specInForce (1989, 9, 30) = false := by decide

def agreeDutyFreeLightOilOrderEnforcementDate : Bool :=
  [(1980,1,1),(1989,9,30),(1989,10,1),(1989,10,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeDutyFreeLightOilOrderEnforcementDate = true := by decide

end JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate
