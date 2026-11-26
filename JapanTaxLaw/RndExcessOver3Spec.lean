import JapanTaxLaw.RndExcessOver3

/-!
# RndExcessOver3 spec — 3%超過の独立定式

Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
art. 10 (第十条). Independent restatement: 「百分の三」を分数 3/100 として扱い、
「超える」を分母を揃えた交差乗算 `100 * rate > 3 * 100` で判定する。
-/

namespace JapanTaxLaw.RndExcessOver3

def specThresholdNum : Nat := 3
def specRateDen : Nat := 100

def specExceeds3 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds3 3 = false := by decide
example : specExceeds3 4 = true := by decide

def agreeRndExcessOver3 : Bool :=
  [0, 1, 2, 3, 4, 12, 100].all fun r =>
    exceeds3 r == specExceeds3 r

example : agreeRndExcessOver3 = true := by decide

end JapanTaxLaw.RndExcessOver3
