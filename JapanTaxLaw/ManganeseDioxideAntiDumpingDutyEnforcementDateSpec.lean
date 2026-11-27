import JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate

/-!
# ManganeseDioxideAntiDumpingDutyEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 420CO0000000196, revision 420CO0000000196_20240301_506CO0000000039.
-/

namespace JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate

def specDate : Nat × Nat × Nat := (2011, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2011) || (d.1 == 2011 && decide (d.2.1 > 4)) ||
  (d.1 == 2011 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2011, 4, 1) = true := by decide
example : specInForce (2011, 3, 31) = false := by decide

def agreeManganeseDioxideAntiDumpingDutyEnforcementDate : Bool :=
  [(1990,1,1),(2011,3,31),(2011,4,1),(2011,4,2),(2015,1,1)].all fun d => inForce d == specInForce d

example : agreeManganeseDioxideAntiDumpingDutyEnforcementDate = true := by decide

end JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate
