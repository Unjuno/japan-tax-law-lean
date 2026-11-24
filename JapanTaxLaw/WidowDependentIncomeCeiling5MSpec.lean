import JapanTaxLaw.WidowDependentIncomeCeiling5M

/-!
# WidowDependentIncomeCeiling5M spec — 五百万円以下の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 23 (第二十三条) 第11号イ(2)・第12号ロ. Independent restatement:
  specWithinCeiling(y) = (y <= 5,000,000) — 境界値は含有（`以下`）。
-/

namespace JapanTaxLaw.WidowDependentIncomeCeiling5M

def specIncomeCeiling : Nat := 5_000_000

def specWithinCeiling (priorYearTotalIncome : Nat) : Bool :=
  priorYearTotalIncome <= 5_000_000

example : specWithinCeiling 5_000_000 = true := by decide
example : specWithinCeiling 5_000_001 = false := by decide

def agreeWidowDependentIncomeCeiling5M : Bool :=
  [0, 1, 499_999, 4_999_999, 5_000_000, 5_000_001, 10_000_000].all fun y =>
    withinCeiling y == specWithinCeiling y

example : agreeWidowDependentIncomeCeiling5M = true := by decide

end JapanTaxLaw.WidowDependentIncomeCeiling5M
