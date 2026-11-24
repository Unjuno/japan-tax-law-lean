import JapanTaxLaw.PreferentialTariffOrderEnforcementDate

/-!
# PreferentialTariffOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 330CO0000000237, revision 330CO0000000237_20250401_507CO0000000141.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.PreferentialTariffOrderEnforcementDate

def specDate : Nat × Nat × Nat := (2005, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2005) || (d.1 == 2005 && decide (d.2.1 > 4)) ||
  (d.1 == 2005 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (2005, 4, 1) = true := by decide
example : specInForce (2005, 3, 31) = false := by decide

def agreePreferentialTariffOrderEnforcementDate : Bool :=
  [(2000,1,1),(2005,3,31),(2005,4,1),(2005,4,2),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreePreferentialTariffOrderEnforcementDate = true := by decide

end JapanTaxLaw.PreferentialTariffOrderEnforcementDate
