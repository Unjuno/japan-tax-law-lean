import JapanTaxLaw.PopulationDensityBracket

/-!
# PopulationDensityBracket spec — 5 区分の独立定式
Sources (pinned): law 507M60000008043, revision 507M60000008043_20250425_000000000000000.
Independent restatement: 境界を 25/50/75/100 とし上から順に判定。
-/

namespace JapanTaxLaw.PopulationDensityBracket

def specRate (d : Nat) : Nat :=
  if d < 25 then 70 else if d < 50 then 60 else if d < 75 then 50 else if d < 100 then 40 else 30

example : specRate 24 = 70 := by decide
example : specRate 100 = 30 := by decide

def agreePopulationDensityBracket : Bool :=
  [0, 24, 25, 49, 50, 74, 75, 99, 100, 200].all fun d => densityRate d == specRate d

example : agreePopulationDensityBracket = true := by decide

end JapanTaxLaw.PopulationDensityBracket
