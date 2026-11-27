import JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate

/-!
# ForeignResidentReciprocityTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 428M60000048005, revision 428M60000048005_20260101_506M60000048004.
-/

namespace JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate

def specDate : Nat × Nat × Nat := (2018, 1, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2018) || (d.1 == 2018 && decide (d.2.1 > 1)) ||
  (d.1 == 2018 && d.2.1 == 1 && decide (d.2.2 >= 1))

example : specInForce (2018, 1, 1) = true := by decide
example : specInForce (2017, 12, 31) = false := by decide

def agreeForeignResidentReciprocityTaxEnforcementDate : Bool :=
  [(1990,1,1),(2017,12,31),(2018,1,1),(2018,1,2),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeForeignResidentReciprocityTaxEnforcementDate = true := by decide

end JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate
