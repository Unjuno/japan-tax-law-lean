import JapanTaxLaw.InternationalTouristTaxEnforcementDate

/-!
# InternationalTouristTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 430CO0000000161, revision 430CO0000000161_20190107_000000000000000.
-/

namespace JapanTaxLaw.InternationalTouristTaxEnforcementDate

def specDate : Nat × Nat × Nat := (2019, 1, 7)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2019) || (d.1 == 2019 && decide (d.2.1 > 1)) ||
  (d.1 == 2019 && d.2.1 == 1 && decide (d.2.2 >= 7))

example : specInForce (2019, 1, 7) = true := by decide
example : specInForce (2019, 1, 6) = false := by decide

def agreeInternationalTouristTaxEnforcementDate : Bool :=
  [(1990,1,1),(2019,1,6),(2019,1,7),(2019,1,8),(2025,1,1)].all fun d => inForce d == specInForce d

example : agreeInternationalTouristTaxEnforcementDate = true := by decide

end JapanTaxLaw.InternationalTouristTaxEnforcementDate
