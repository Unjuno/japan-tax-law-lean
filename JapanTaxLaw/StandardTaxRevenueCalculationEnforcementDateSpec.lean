import JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate

/-!
# StandardTaxRevenueCalculationEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 429M60000008030, revision 429M60000008030_20260401_508M60000008048.
-/

namespace JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate

def specDate : Nat × Nat × Nat := (2019, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2019) || (d.1 == 2019 && decide (d.2.1 > 4)) ||
  (d.1 == 2019 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2019, 4, 1) = true := by decide
example : specInForce (2019, 3, 31) = false := by decide

def agreeStandardTaxRevenueCalculationEnforcementDate : Bool :=
  [(1990,1,1),(2019,3,31),(2019,4,1),(2019,4,2),(2025,1,1)].all fun d => inForce d == specInForce d

example : agreeStandardTaxRevenueCalculationEnforcementDate = true := by decide

end JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate
