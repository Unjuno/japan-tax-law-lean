import JapanTaxLaw.PurebredLivestockCertificateEnforcementDate

/-!
# PurebredLivestockCertificateEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 407M50000200013, revision 407M50000200013_20201221_502M60000200083.
-/

namespace JapanTaxLaw.PurebredLivestockCertificateEnforcementDate

def specDate : Nat × Nat × Nat := (2000, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2000) || (d.1 == 2000 && decide (d.2.1 > 4)) ||
  (d.1 == 2000 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2000, 4, 1) = true := by decide
example : specInForce (2000, 3, 31) = false := by decide

def agreePurebredLivestockCertificateEnforcementDate : Bool :=
  [(1990,1,1),(2000,3,31),(2000,4,1),(2000,4,2),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreePurebredLivestockCertificateEnforcementDate = true := by decide

end JapanTaxLaw.PurebredLivestockCertificateEnforcementDate
