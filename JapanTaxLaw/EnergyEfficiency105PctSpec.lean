import JapanTaxLaw.EnergyEfficiency105Pct

/-! # EnergyEfficiency105Pct spec — 105%比較の独立定式 (law 332AC0000000026 / art.90の12)
交差乗算 `100*eff >= 105*base` で判定する。 -/

namespace JapanTaxLaw.EnergyEfficiency105Pct

def specPercentNum : Nat := 105
def specRateDen : Nat := 100

def specMeets (eff base : Nat) : Bool :=
  specRateDen * eff >= specPercentNum * base

example : specMeets 105 100 = true := by decide
example : specMeets 104 100 = false := by decide

def agreeEnergyEfficiency105Pct : Bool :=
  [(0,0),(104,100),(105,100),(106,100),(100,101),(1050,1000),(1049,1000)].all fun eb =>
    meets eb.1 eb.2 == specMeets eb.1 eb.2

example : agreeEnergyEfficiency105Pct = true := by decide

end JapanTaxLaw.EnergyEfficiency105Pct
