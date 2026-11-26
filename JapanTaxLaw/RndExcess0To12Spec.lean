import JapanTaxLaw.RndExcess0To12

/-!
# RndExcess0To12 spec — [0%, 12%] 区間の独立定式

Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
art. 10. Independent restatement: 上限を分数 12/100 として扱い、
`100 * rate >= 0 * 100 && 100 * rate <= 12 * 100` で判定する。
-/

namespace JapanTaxLaw.RndExcess0To12

def specUpperNum : Nat := 12
def specRateDen : Nat := 100

def specInRange (rate : Nat) : Bool :=
  specRateDen * rate >= 0 * specRateDen &&
  specRateDen * rate <= specUpperNum * specRateDen

example : specInRange 0 = true := by decide
example : specInRange 12 = true := by decide
example : specInRange 13 = false := by decide

def agreeRndExcess0To12 : Bool :=
  [0, 1, 3, 11, 12, 13, 100].all fun r =>
    inRange r == specInRange r

example : agreeRndExcess0To12 = true := by decide

end JapanTaxLaw.RndExcess0To12
