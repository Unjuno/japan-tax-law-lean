import JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate

/-!
# TobaccoSpecialTaxRuleEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 410M50000040122, revision 410M50000040122_20150401_427M60000040039.
-/

namespace JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate

def specDate : Nat × Nat × Nat := (2004, 1, 19)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2004) || (d.1 == 2004 && decide (d.2.1 > 1)) ||
  (d.1 == 2004 && d.2.1 == 1 && decide (d.2.2 >= 19))

example : specInForce (2004, 1, 19) = true := by decide
example : specInForce (2004, 1, 18) = false := by decide

def agreeTobaccoSpecialTaxRuleEnforcementDate : Bool :=
  [(1990,1,1),(2004,1,18),(2004,1,19),(2004,1,20),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreeTobaccoSpecialTaxRuleEnforcementDate = true := by decide

end JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate
