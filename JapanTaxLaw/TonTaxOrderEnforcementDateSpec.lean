import JapanTaxLaw.TonTaxOrderEnforcementDate

/-!
# TonTaxOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 332CO0000000048, revision 332CO0000000048_20201001_502CO0000000128.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.TonTaxOrderEnforcementDate

def specDate : Nat × Nat × Nat := (1989, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1989) || (d.1 == 1989 && decide (d.2.1 > 4)) ||
  (d.1 == 1989 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1989, 4, 1) = true := by decide
example : specInForce (1989, 3, 31) = false := by decide

def agreeTonTaxOrderEnforcementDate : Bool :=
  [(1980,1,1),(1989,3,31),(1989,4,1),(1989,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeTonTaxOrderEnforcementDate = true := by decide

end JapanTaxLaw.TonTaxOrderEnforcementDate
