import JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k

/-!
# LocalTaxDependentIncomeCeiling1350k spec — 135万円上限の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 24の5 (第二十四条の五). Independent restatement: income <= 1350000（境界値を含む）。
-/

namespace JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k

def specIncomeCeiling : Nat := 1350000

def specWithinCeiling (income : Nat) : Bool :=
  income <= 1350000

example : specWithinCeiling 1350000 = true := by decide
example : specWithinCeiling 1350001 = false := by decide

def agreeLocalTaxDependentIncomeCeiling1350k : Bool :=
  [0, 1, 1349999, 1350000, 1350001, 2000000].all fun y =>
    withinCeiling y == specWithinCeiling y

example : agreeLocalTaxDependentIncomeCeiling1350k = true := by decide

end JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k
