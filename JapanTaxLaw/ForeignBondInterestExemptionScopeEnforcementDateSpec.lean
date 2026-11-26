import JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate

/-!
# ForeignBondInterestExemptionScopeEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 333CO0000000337, revision 333CO0000000337_20171001_429CO0000000106.
-/

namespace JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate

def specDate : Nat × Nat × Nat := (1965, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1965) || (d.1 == 1965 && decide (d.2.1 > 4)) ||
  (d.1 == 1965 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1965, 4, 1) = true := by decide
example : specInForce (1965, 3, 31) = false := by decide

def agreeForeignBondInterestExemptionScopeEnforcementDate : Bool :=
  [(1950,1,1),(1965,3,31),(1965,4,1),(1965,4,2),(1980,1,1)].all fun d => inForce d == specInForce d

example : agreeForeignBondInterestExemptionScopeEnforcementDate = true := by decide

end JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate
