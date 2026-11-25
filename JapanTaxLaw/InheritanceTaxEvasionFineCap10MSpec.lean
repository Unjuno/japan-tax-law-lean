import JapanTaxLaw.InheritanceTaxEvasionFineCap10M

/-!
# InheritanceTaxEvasionFineCap10M spec — 1000万円上限の独立定式
Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008,
art. 68 (第六十八条). Independent restatement: fine <= 10000000（境界値を含む）。
-/

namespace JapanTaxLaw.InheritanceTaxEvasionFineCap10M

def specFineCap : Nat := 10000000

def specWithinCap (fine : Nat) : Bool :=
  fine <= 10000000

example : specWithinCap 10000000 = true := by decide
example : specWithinCap 10000001 = false := by decide

def agreeInheritanceTaxEvasionFineCap10M : Bool :=
  [0, 1, 9999999, 10000000, 10000001, 20000000].all fun f =>
    withinCap f == specWithinCap f

example : agreeInheritanceTaxEvasionFineCap10M = true := by decide

end JapanTaxLaw.InheritanceTaxEvasionFineCap10M
