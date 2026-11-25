import JapanTaxLaw.LocalCapitalCeiling10M

/-!
# LocalCapitalCeiling10M spec — 1000万円上限の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 52 (第五十二条) ホ. Independent restatement: capital <= 10000000（境界値を含む）。
-/

namespace JapanTaxLaw.LocalCapitalCeiling10M

def specCapitalCeiling : Nat := 10000000

def specWithinCeiling (capital : Nat) : Bool :=
  capital <= 10000000

example : specWithinCeiling 10000000 = true := by decide
example : specWithinCeiling 10000001 = false := by decide

def agreeLocalCapitalCeiling10M : Bool :=
  [0, 1, 9999999, 10000000, 10000001, 20000000].all fun c =>
    withinCeiling c == specWithinCeiling c

example : agreeLocalCapitalCeiling10M = true := by decide

end JapanTaxLaw.LocalCapitalCeiling10M
