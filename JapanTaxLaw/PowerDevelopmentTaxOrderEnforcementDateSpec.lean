import JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate

/-!
# PowerDevelopmentTaxOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 349CO0000000339, revision 349CO0000000339_20250401_507CO0000000006.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate

def specDate : Nat × Nat × Nat := (2000, 3, 21)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2000) || (d.1 == 2000 && decide (d.2.1 > 3)) ||
  (d.1 == 2000 && d.2.1 == 3 && decide (d.2.2 >= 21))

example : specInForce (2000, 3, 21) = true := by decide
example : specInForce (2000, 3, 20) = false := by decide

def agreePowerDevelopmentTaxOrderEnforcementDate : Bool :=
  [(1999,1,1),(2000,3,20),(2000,3,21),(2000,3,22),(2000,4,1),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreePowerDevelopmentTaxOrderEnforcementDate = true := by decide

end JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate
