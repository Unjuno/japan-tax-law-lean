import JapanTaxLaw.RndExcessAtMost3

/-!
# RndExcessAtMost3 spec — 3%以下の独立定式

Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
art. 10. Independent restatement: 「百分の三」を分数 3/100 として扱い、
「以下」を分母を揃えた交差乗算 `100 * rate <= 3 * 100` で判定する。
-/

namespace JapanTaxLaw.RndExcessAtMost3

def specThresholdNum : Nat := 3
def specRateDen : Nat := 100

def specAtMost3 (rate : Nat) : Bool :=
  specRateDen * rate <= specThresholdNum * specRateDen

example : specAtMost3 3 = true := by decide
example : specAtMost3 4 = false := by decide

def agreeRndExcessAtMost3 : Bool :=
  [0, 1, 2, 3, 4, 12, 100].all fun r =>
    atMost3 r == specAtMost3 r

example : agreeRndExcessAtMost3 = true := by decide

end JapanTaxLaw.RndExcessAtMost3
