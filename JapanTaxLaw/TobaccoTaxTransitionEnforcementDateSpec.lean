import JapanTaxLaw.TobaccoTaxTransitionEnforcementDate

/-!
# TobaccoTaxTransitionEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 427CO0000000156, revision 427CO0000000156_20250401_507CO0000000006.
-/

namespace JapanTaxLaw.TobaccoTaxTransitionEnforcementDate

def specDate : Nat × Nat × Nat := (2017, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2017) || (d.1 == 2017 && decide (d.2.1 > 4)) ||
  (d.1 == 2017 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2017, 4, 1) = true := by decide
example : specInForce (2017, 3, 31) = false := by decide

def agreeTobaccoTaxTransitionEnforcementDate : Bool :=
  [(1990,1,1),(2017,3,31),(2017,4,1),(2017,4,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeTobaccoTaxTransitionEnforcementDate = true := by decide

end JapanTaxLaw.TobaccoTaxTransitionEnforcementDate
