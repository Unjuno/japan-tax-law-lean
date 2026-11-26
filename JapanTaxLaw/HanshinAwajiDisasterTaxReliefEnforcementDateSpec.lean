import JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate

/-!
# HanshinAwajiDisasterTaxReliefEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 407M50000040012, revision 407M50000040012_20090401_421M60000040020.
-/

namespace JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate

def specDate : Nat × Nat × Nat := (2002, 8, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2002) || (d.1 == 2002 && decide (d.2.1 > 8)) ||
  (d.1 == 2002 && d.2.1 == 8 && decide (d.2.2 >= 1))

example : specInForce (2002, 8, 1) = true := by decide
example : specInForce (2002, 7, 31) = false := by decide

def agreeHanshinAwajiDisasterTaxReliefEnforcementDate : Bool :=
  [(1990,1,1),(2002,7,31),(2002,8,1),(2002,8,2),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreeHanshinAwajiDisasterTaxReliefEnforcementDate = true := by decide

end JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate
