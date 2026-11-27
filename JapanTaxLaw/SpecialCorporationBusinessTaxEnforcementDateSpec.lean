import JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate

/-!
# SpecialCorporationBusinessTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 431CO0000000089, revision 431CO0000000089_20240401_506CO0000000012.
-/

namespace JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate

def specDate : Nat × Nat × Nat := (2019, 10, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2019) || (d.1 == 2019 && decide (d.2.1 > 10)) ||
  (d.1 == 2019 && d.2.1 == 10 && decide (d.2.2 >= 1))

example : specInForce (2019, 10, 1) = true := by decide
example : specInForce (2019, 9, 30) = false := by decide

def agreeSpecialCorporationBusinessTaxEnforcementDate : Bool :=
  [(1990,1,1),(2019,9,30),(2019,10,1),(2019,10,2),(2025,1,1)].all fun d => inForce d == specInForce d

example : agreeSpecialCorporationBusinessTaxEnforcementDate = true := by decide

end JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate
