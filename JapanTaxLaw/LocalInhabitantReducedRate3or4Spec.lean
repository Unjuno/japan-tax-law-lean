import JapanTaxLaw.LocalInhabitantReducedRate3or4

/-!
# LocalInhabitantReducedRate3or4 spec — 3%/4% の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 314の6. Independent restatement: 割合そのものを 3 または 4 として選択し、
base × 割合 / 100 を計算する。
-/

namespace JapanTaxLaw.LocalInhabitantReducedRate3or4

def specRate (designatedCity : Bool) : Nat :=
  if designatedCity then 4 else 3

def specAmount (base : Nat) (designatedCity : Bool) : Nat :=
  base * specRate designatedCity / 100

example : specRate true = 4 := by decide
example : specRate false = 3 := by decide

def agreeLocalInhabitantReducedRate3or4 : Bool :=
  [(0,false),(1,false),(99,true),(100,false),(100,true),(10_000,false),(10_000,true)].all fun bc =>
    amount bc.1 bc.2 == specAmount bc.1 bc.2

example : agreeLocalInhabitantReducedRate3or4 = true := by decide

end JapanTaxLaw.LocalInhabitantReducedRate3or4
