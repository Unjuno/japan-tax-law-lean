import JapanTaxLaw.TariffQuotaSystemEnforcementDate

/-!
# TariffQuotaSystemEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 336CO0000000153, revision 336CO0000000153_20260401_508CO0000000085.
-/

namespace JapanTaxLaw.TariffQuotaSystemEnforcementDate

def specDate : Nat × Nat × Nat := (1991, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1991) || (d.1 == 1991 && decide (d.2.1 > 4)) ||
  (d.1 == 1991 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1991, 4, 1) = true := by decide
example : specInForce (1991, 3, 31) = false := by decide

def agreeTariffQuotaSystemEnforcementDate : Bool :=
  [(1980,1,1),(1991,3,31),(1991,4,1),(1991,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeTariffQuotaSystemEnforcementDate = true := by decide

end JapanTaxLaw.TariffQuotaSystemEnforcementDate
