import JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate

/-!
# ForeignCapitalSpecialOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 340CO0000000084, revision 340CO0000000084_20171001_429CO0000000106.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate

def specDate : Nat × Nat × Nat := (2014, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2014) || (d.1 == 2014 && decide (d.2.1 > 4)) ||
  (d.1 == 2014 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2014, 4, 1) = true := by decide
example : specInForce (2014, 3, 31) = false := by decide

def agreeForeignCapitalSpecialOrderEnforcementDate : Bool :=
  [(2010,1,1),(2014,3,31),(2014,4,1),(2014,4,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeForeignCapitalSpecialOrderEnforcementDate = true := by decide

end JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate
