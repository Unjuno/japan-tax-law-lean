import JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate

/-!
# LocalCorporationTaxRuleEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 426M60000040022, revision 426M60000040022_20260414_508M60000040040.
-/

namespace JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate

def specDate : Nat × Nat × Nat := (2014, 10, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2014) || (d.1 == 2014 && decide (d.2.1 > 10)) ||
  (d.1 == 2014 && d.2.1 == 10 && decide (d.2.2 >= 1))

example : specInForce (2014, 10, 1) = true := by decide
example : specInForce (2014, 9, 30) = false := by decide

def agreeLocalCorporationTaxRuleEnforcementDate : Bool :=
  [(1990,1,1),(2014,9,30),(2014,10,1),(2014,10,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeLocalCorporationTaxRuleEnforcementDate = true := by decide

end JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate
