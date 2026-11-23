import JapanTaxLaw.PopulationDensityBracketFY8

/-!
# PopulationDensityBracketFY8 spec — 5 区分の独立定式
Sources (pinned): law 508M60000008066, revision 508M60000008066_20260427_000000000000000.
-/

namespace JapanTaxLaw.PopulationDensityBracketFY8

def specRate (d : Nat) : Nat :=
  if d < 25 then 70 else if d < 50 then 60 else if d < 75 then 50 else if d < 100 then 40 else 30

example : specRate 24 = 70 := by decide
example : specRate 100 = 30 := by decide

def agreePopulationDensityBracketFY8 : Bool :=
  [0, 24, 25, 49, 50, 74, 75, 99, 100, 200].all fun d => densityRate d == specRate d

example : agreePopulationDensityBracketFY8 = true := by decide

end JapanTaxLaw.PopulationDensityBracketFY8
