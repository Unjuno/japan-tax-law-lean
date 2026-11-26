import JapanTaxLaw.CountervailingDutyEnforcementDate

/-!
# CountervailingDutyEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 406CO0000000415, revision 406CO0000000415_20171008_428CO0000000240.
-/

namespace JapanTaxLaw.CountervailingDutyEnforcementDate

def specDate : Nat × Nat × Nat := (2001, 1, 6)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2001) || (d.1 == 2001 && decide (d.2.1 > 1)) ||
  (d.1 == 2001 && d.2.1 == 1 && decide (d.2.2 >= 6))

example : specInForce (2001, 1, 6) = true := by decide
example : specInForce (2001, 1, 5) = false := by decide

def agreeCountervailingDutyEnforcementDate : Bool :=
  [(1980,1,1),(2001,1,5),(2001,1,6),(2001,1,7),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreeCountervailingDutyEnforcementDate = true := by decide

end JapanTaxLaw.CountervailingDutyEnforcementDate
