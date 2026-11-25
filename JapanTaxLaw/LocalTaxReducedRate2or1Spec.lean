import JapanTaxLaw.LocalTaxReducedRate2or1

/-!
# LocalTaxReducedRate2or1 spec — 2%/1% の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 37 (第三十七条). Independent restatement: 指定都市は base/100、それ以外は base/50。
-/

namespace JapanTaxLaw.LocalTaxReducedRate2or1

def specAmount (base : Nat) (designatedCity : Bool) : Nat :=
  if designatedCity then base / 100 else base / 50

example : specAmount 10_000 true = 100 := by decide
example : specAmount 10_000 false = 200 := by decide

def agreeLocalTaxReducedRate2or1 : Bool :=
  [(0,false),(1,false),(99,true),(100,false),(100,true),(10_000,false),(10_000,true)].all fun bc =>
    amount bc.1 bc.2 == specAmount bc.1 bc.2

example : agreeLocalTaxReducedRate2or1 = true := by decide

end JapanTaxLaw.LocalTaxReducedRate2or1
