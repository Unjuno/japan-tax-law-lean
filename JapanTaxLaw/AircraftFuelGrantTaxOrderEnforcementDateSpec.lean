import JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate

/-!
# AircraftFuelGrantTaxOrderEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 347CO0000000167, revision 347CO0000000167_20140312_426CO0000000059.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate

def specDate : Nat × Nat × Nat := (1979, 4, 1)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1979) || (d.1 == 1979 && decide (d.2.1 > 4)) ||
  (d.1 == 1979 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1979, 4, 1) = true := by decide
example : specInForce (1979, 3, 31) = false := by decide

def agreeAircraftFuelGrantTaxOrderEnforcementDate : Bool :=
  [(1970,1,1),(1979,3,31),(1979,4,1),(1979,4,2),(2000,1,1)].all fun d => inForce d == specInForce d

example : agreeAircraftFuelGrantTaxOrderEnforcementDate = true := by decide

end JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate
