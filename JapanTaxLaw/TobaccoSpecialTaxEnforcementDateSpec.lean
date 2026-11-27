import JapanTaxLaw.TobaccoSpecialTaxEnforcementDate

/-!
# TobaccoSpecialTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 410CO0000000345, revision 410CO0000000345_20241001_506CO0000000147.
-/

namespace JapanTaxLaw.TobaccoSpecialTaxEnforcementDate

def specDate : Nat × Nat × Nat := (1998, 12, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1998) || (d.1 == 1998 && decide (d.2.1 > 12)) ||
  (d.1 == 1998 && d.2.1 == 12 && decide (d.2.2 >= 1))

example : specInForce (1998, 12, 1) = true := by decide
example : specInForce (1998, 11, 30) = false := by decide

def agreeTobaccoSpecialTaxEnforcementDate : Bool :=
  [(1980,1,1),(1998,11,30),(1998,12,1),(1998,12,2),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreeTobaccoSpecialTaxEnforcementDate = true := by decide

end JapanTaxLaw.TobaccoSpecialTaxEnforcementDate
