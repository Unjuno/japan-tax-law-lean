import JapanTaxLaw.RndExcessOver4Year

/-!
# RndExcessOver4Year spec — 4%超過の独立定式
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` / art. 10.
Independent restatement: 「百分の四」を 4/100 とし、「超える」を `100*r > 4*100` で判定する。
-/

namespace JapanTaxLaw.RndExcessOver4Year

def specThresholdNum : Nat := 4
def specRateDen : Nat := 100

def specExceeds4 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds4 4 = false := by decide
example : specExceeds4 5 = true := by decide

def agreeRndExcessOver4Year : Bool :=
  [0, 3, 4, 5, 12, 100].all fun r => exceeds4 r == specExceeds4 r

example : agreeRndExcessOver4Year = true := by decide

end JapanTaxLaw.RndExcessOver4Year
