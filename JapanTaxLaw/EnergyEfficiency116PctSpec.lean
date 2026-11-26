import JapanTaxLaw.EnergyEfficiency116Pct

/-! # EnergyEfficiency116Pct spec — 116%比較の独立定式 (law 332CO0000000043 / art.51の2)
交差乗算 `100*eff >= 116*base` で判定する。 -/

namespace JapanTaxLaw.EnergyEfficiency116Pct

def specPercentNum : Nat := 116
def specRateDen : Nat := 100

def specMeets (eff base : Nat) : Bool :=
  specRateDen * eff >= specPercentNum * base

example : specMeets 116 100 = true := by decide
example : specMeets 115 100 = false := by decide

def agreeEnergyEfficiency116Pct : Bool :=
  [(0,0),(115,100),(116,100),(117,100),(100,101),(1160,1000),(1159,1000)].all fun eb =>
    meets eb.1 eb.2 == specMeets eb.1 eb.2

example : agreeEnergyEfficiency116Pct = true := by decide

end JapanTaxLaw.EnergyEfficiency116Pct
