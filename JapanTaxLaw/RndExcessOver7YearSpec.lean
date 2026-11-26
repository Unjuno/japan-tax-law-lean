import JapanTaxLaw.RndExcessOver7Year

/-!
# RndExcessOver7Year spec — 7%超過の独立定式
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` / art. 10.
Independent restatement: 「百分の七」を 7/100 とし、「超える」を `100*r > 7*100` で判定する。
-/

namespace JapanTaxLaw.RndExcessOver7Year

def specThresholdNum : Nat := 7
def specRateDen : Nat := 100

def specExceeds7 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds7 7 = false := by decide
example : specExceeds7 8 = true := by decide

def agreeRndExcessOver7Year : Bool :=
  [0, 3, 6, 7, 8, 12, 100].all fun r => exceeds7 r == specExceeds7 r

example : agreeRndExcessOver7Year = true := by decide

end JapanTaxLaw.RndExcessOver7Year
