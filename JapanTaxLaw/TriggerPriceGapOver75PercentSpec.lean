import JapanTaxLaw.TriggerPriceGapOver75Percent

/-! # TriggerPriceGapOver75Percent spec — 75%比較の独立定式 (law 335AC0000000036 / art.7の4)
実装の「掛けてから割る」に対し、独立仕様は交差乗算 `100*gap > 75*base` で判定する。 -/

namespace JapanTaxLaw.TriggerPriceGapOver75Percent

def specPercentNum : Nat := 75
def specRateDen : Nat := 100

def specExceeds (gap base : Nat) : Bool :=
  specRateDen * gap > specPercentNum * base

example : specExceeds 76 100 = true := by decide
example : specExceeds 75 100 = false := by decide

def agreeTriggerPriceGapOver75Percent : Bool :=
  [(0,0),(74,100),(75,100),(76,100),(100,101),(751,1000),(750,1000)].all fun gb =>
    exceeds gb.1 gb.2 == specExceeds gb.1 gb.2

example : agreeTriggerPriceGapOver75Percent = true := by decide

end JapanTaxLaw.TriggerPriceGapOver75Percent
