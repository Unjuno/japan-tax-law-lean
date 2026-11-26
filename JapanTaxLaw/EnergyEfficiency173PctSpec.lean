import JapanTaxLaw.EnergyEfficiency173Pct

/-! # EnergyEfficiency173Pct spec — 173%比較の独立定式 (law 332CO0000000043 / art.51の2)
交差乗算 `100*eff >= 173*base` で判定する。 -/

namespace JapanTaxLaw.EnergyEfficiency173Pct

def specPercentNum : Nat := 173
def specRateDen : Nat := 100

def specMeets (eff base : Nat) : Bool :=
  specRateDen * eff >= specPercentNum * base

example : specMeets 173 100 = true := by decide
example : specMeets 172 100 = false := by decide

def agreeEnergyEfficiency173Pct : Bool :=
  [(0,0),(172,100),(173,100),(174,100),(100,101),(1730,1000),(1729,1000)].all fun eb =>
    meets eb.1 eb.2 == specMeets eb.1 eb.2

example : agreeEnergyEfficiency173Pct = true := by decide

end JapanTaxLaw.EnergyEfficiency173Pct
