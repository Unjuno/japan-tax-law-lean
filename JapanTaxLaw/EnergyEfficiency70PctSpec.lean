import JapanTaxLaw.EnergyEfficiency70Pct

/-! # EnergyEfficiency70Pct spec — 70%比較の独立定式 (law 332AC0000000026 / art.90の12)
実装の「掛けてから割る」に対し、独立仕様は交差乗算 `100*eff >= 70*base` で判定する。 -/

namespace JapanTaxLaw.EnergyEfficiency70Pct

def specPercentNum : Nat := 70
def specRateDen : Nat := 100

def specMeets (eff base : Nat) : Bool :=
  specRateDen * eff >= specPercentNum * base

example : specMeets 70 100 = true := by decide
example : specMeets 69 100 = false := by decide

def agreeEnergyEfficiency70Pct : Bool :=
  [(0,0),(69,100),(70,100),(71,100),(100,101),(700,1000),(699,1000)].all fun eb =>
    meets eb.1 eb.2 == specMeets eb.1 eb.2

example : agreeEnergyEfficiency70Pct = true := by decide

end JapanTaxLaw.EnergyEfficiency70Pct
