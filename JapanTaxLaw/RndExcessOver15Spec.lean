import JapanTaxLaw.RndExcessOver15

/-!
# RndExcessOver15 spec — 15%超過の独立定式

Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
art. 10. Independent restatement: 「百分の十五」を分数 15/100 として扱い、
「超える」を分母を揃えた交差乗算 `100 * rate > 15 * 100` で判定する。
-/

namespace JapanTaxLaw.RndExcessOver15

def specThresholdNum : Nat := 15
def specRateDen : Nat := 100

def specExceeds15 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds15 15 = false := by decide
example : specExceeds15 16 = true := by decide

def agreeRndExcessOver15 : Bool :=
  [0, 3, 12, 14, 15, 16, 100].all fun r =>
    exceeds15 r == specExceeds15 r

example : agreeRndExcessOver15 = true := by decide

end JapanTaxLaw.RndExcessOver15
