import JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate

/-!
# CustomsOfficerBadgeFormEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 329M50000040064, revision 329M50000040064_20220401_504M60000040011.
-/

namespace JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate

def specDate : Nat × Nat × Nat := (1977, 7, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1977) || (d.1 == 1977 && decide (d.2.1 > 7)) ||
  (d.1 == 1977 && d.2.1 == 7 && decide (d.2.2 >= 1))

example : specInForce (1977, 7, 1) = true := by decide
example : specInForce (1977, 6, 30) = false := by decide

def agreeCustomsOfficerBadgeFormEnforcementDate : Bool :=
  [(1950,1,1),(1977,6,30),(1977,7,1),(1977,7,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeCustomsOfficerBadgeFormEnforcementDate = true := by decide

end JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate
