import JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate

/-!
# HeavyOilQuotaOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 336M50000400035, revision 336M50000400035_20201228_502M60000400092.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate

def specDate : Nat × Nat × Nat := (2012, 3, 19)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2012) || (d.1 == 2012 && decide (d.2.1 > 3)) ||
  (d.1 == 2012 && d.2.1 == 3 && decide (d.2.2 >= 19))

example : specInForce (2012, 3, 19) = true := by decide
example : specInForce (2012, 3, 18) = false := by decide

def agreeHeavyOilQuotaOrderEnforcementDate : Bool :=
  [(2010,1,1),(2012,3,18),(2012,3,19),(2012,3,20),(2012,4,1),(2020,1,1)].all fun d => inForce d == specInForce d

example : agreeHeavyOilQuotaOrderEnforcementDate = true := by decide

end JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate
