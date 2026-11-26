import JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate

/-!
# ReconstructionSpecialIncomeTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 424CO0000000016, revision 424CO0000000016_20260525_507CO0000000244.
-/

namespace JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate

def specDate : Nat × Nat × Nat := (2016, 1, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2016) || (d.1 == 2016 && decide (d.2.1 > 1)) ||
  (d.1 == 2016 && d.2.1 == 1 && decide (d.2.2 >= 1))

example : specInForce (2016, 1, 1) = true := by decide
example : specInForce (2015, 12, 31) = false := by decide

def agreeReconstructionSpecialIncomeTaxEnforcementDate : Bool :=
  [(1990,1,1),(2015,12,31),(2016,1,1),(2016,1,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeReconstructionSpecialIncomeTaxEnforcementDate = true := by decide

end JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate
