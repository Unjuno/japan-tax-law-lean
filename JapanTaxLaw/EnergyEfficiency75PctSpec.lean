import JapanTaxLaw.EnergyEfficiency75Pct

/-! # EnergyEfficiency75Pct spec — 75%比較の独立定式 (law 332AC0000000026 / art.90の12)
実装の「掛けてから割る」に対し、独立仕様は交差乗算 `100*eff >= 75*base` で判定する。 -/

namespace JapanTaxLaw.EnergyEfficiency75Pct

def specPercentNum : Nat := 75
def specRateDen : Nat := 100

def specMeets (eff base : Nat) : Bool :=
  specRateDen * eff >= specPercentNum * base

example : specMeets 75 100 = true := by decide
example : specMeets 74 100 = false := by decide

def agreeEnergyEfficiency75Pct : Bool :=
  [(0,0),(74,100),(75,100),(76,100),(100,101),(750,1000),(749,1000)].all fun eb =>
    meets eb.1 eb.2 == specMeets eb.1 eb.2

example : agreeEnergyEfficiency75Pct = true := by decide

end JapanTaxLaw.EnergyEfficiency75Pct
