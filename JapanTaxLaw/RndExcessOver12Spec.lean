import JapanTaxLaw.RndExcessOver12

/-!
# RndExcessOver12 spec — 12%超過の独立定式

Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
art. 10 (第十条). Independent restatement: 「百分の十二」を分数 12/100 として扱い、
「超える」を分母を揃えた交差乗算 `100 * rate > 12 * 100` で判定する。
-/

namespace JapanTaxLaw.RndExcessOver12

def specThresholdNum : Nat := 12
def specRateDen : Nat := 100

def specExceeds12 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds12 12 = false := by decide
example : specExceeds12 13 = true := by decide

def agreeRndExcessOver12 : Bool :=
  [0, 3, 11, 12, 13, 15, 100].all fun r =>
    exceeds12 r == specExceeds12 r

example : agreeRndExcessOver12 = true := by decide

end JapanTaxLaw.RndExcessOver12
