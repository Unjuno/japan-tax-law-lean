import JapanTaxLaw.RndExcess3To15

/-!
# RndExcess3To15 spec — (3%, 15%] 区間の独立定式

Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
art. 10. Independent restatement: 両端を分数 3/100 と 15/100 として扱い、
分母を揃えた交差乗算で `100*r > 3*100 && 100*r <= 15*100` を判定する。
-/

namespace JapanTaxLaw.RndExcess3To15

def specLowerNum : Nat := 3
def specUpperNum : Nat := 15
def specRateDen : Nat := 100

def specInRange (rate : Nat) : Bool :=
  specRateDen * rate > specLowerNum * specRateDen &&
  specRateDen * rate <= specUpperNum * specRateDen

example : specInRange 3 = false := by decide
example : specInRange 15 = true := by decide
example : specInRange 16 = false := by decide

def agreeRndExcess3To15 : Bool :=
  [0, 2, 3, 4, 12, 14, 15, 16, 100].all fun r =>
    inRange r == specInRange r

example : agreeRndExcess3To15 = true := by decide

end JapanTaxLaw.RndExcess3To15
