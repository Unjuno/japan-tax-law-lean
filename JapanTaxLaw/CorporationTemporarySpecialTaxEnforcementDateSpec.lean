import JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate

/-!
# CorporationTemporarySpecialTaxEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 403M50000040006, revision 403M50000040006_20030106_414M60000040072.
-/

namespace JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate

def specDate : Nat × Nat × Nat := (2003, 1, 6)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2003) || (d.1 == 2003 && decide (d.2.1 > 1)) ||
  (d.1 == 2003 && d.2.1 == 1 && decide (d.2.2 >= 6))

example : specInForce (2003, 1, 6) = true := by decide
example : specInForce (2003, 1, 5) = false := by decide

def agreeCorporationTemporarySpecialTaxEnforcementDate : Bool :=
  [(1990,1,1),(2003,1,5),(2003,1,6),(2003,1,7),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreeCorporationTemporarySpecialTaxEnforcementDate = true := by decide

end JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate
