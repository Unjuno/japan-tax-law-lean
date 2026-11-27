import JapanTaxLaw.EnergyEfficiency110Pct

/-! # EnergyEfficiency110Pct spec — 110%比較の独立定式 (law 332CO0000000043 / art.51の2)
交差乗算 `100*eff >= 110*base` で判定する。 -/

namespace JapanTaxLaw.EnergyEfficiency110Pct

def specPercentNum : Nat := 110
def specRateDen : Nat := 100

def specMeets (eff base : Nat) : Bool :=
  specRateDen * eff >= specPercentNum * base

example : specMeets 110 100 = true := by decide
example : specMeets 109 100 = false := by decide

def agreeEnergyEfficiency110Pct : Bool :=
  [(0,0),(109,100),(110,100),(111,100),(100,101),(1100,1000),(1099,1000)].all fun eb =>
    meets eb.1 eb.2 == specMeets eb.1 eb.2

example : agreeEnergyEfficiency110Pct = true := by decide

end JapanTaxLaw.EnergyEfficiency110Pct
