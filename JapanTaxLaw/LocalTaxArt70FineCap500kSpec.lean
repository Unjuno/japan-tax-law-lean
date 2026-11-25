import JapanTaxLaw.LocalTaxArt70FineCap500k

/-!
# LocalTaxArt70FineCap500k spec — 50万円上限の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 70 (第七十条). Independent restatement: fine <= 500000（境界値を含む）。
-/

namespace JapanTaxLaw.LocalTaxArt70FineCap500k

def specFineCap : Nat := 500000

def specWithinCap (fine : Nat) : Bool :=
  fine <= 500000

example : specWithinCap 500000 = true := by decide
example : specWithinCap 500001 = false := by decide

def agreeLocalTaxArt70FineCap500k : Bool :=
  [0, 1, 499999, 500000, 500001, 1000000].all fun f =>
    withinCap f == specWithinCap f

example : agreeLocalTaxArt70FineCap500k = true := by decide

end JapanTaxLaw.LocalTaxArt70FineCap500k
