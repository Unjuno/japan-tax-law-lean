import JapanTaxLaw.PopulationDensityBracketFY8

/-!
# PopulationDensityBracketFY8 tests — 人口密度区分（令和八年度）smoke checks
Decidable smoke tests, pinned to law 508M60000008066 / revision 508M60000008066_20260427_000000000000000.
-/

namespace JapanTaxLaw.PopulationDensityBracketFY8

example : densityRate 24 = 70 := by decide
example : densityRate 25 = 60 := by decide
example : densityRate 50 = 50 := by decide
example : densityRate 75 = 40 := by decide
example : densityRate 100 = 30 := by decide

end JapanTaxLaw.PopulationDensityBracketFY8
