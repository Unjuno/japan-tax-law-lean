import JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate

/-!
# ReconstructionSpecialIncomeTaxRuleEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 424M60000040006, revision 424M60000040006_20260901_506M60000040028.
-/

namespace JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate

def specDate : Nat × Nat × Nat := (2016, 1, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2016) || (d.1 == 2016 && decide (d.2.1 > 1)) ||
  (d.1 == 2016 && d.2.1 == 1 && decide (d.2.2 >= 1))

example : specInForce (2016, 1, 1) = true := by decide
example : specInForce (2015, 12, 31) = false := by decide

def agreeReconstructionSpecialIncomeTaxRuleEnforcementDate : Bool :=
  [(1990,1,1),(2015,12,31),(2016,1,1),(2016,1,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeReconstructionSpecialIncomeTaxRuleEnforcementDate = true := by decide

end JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate
