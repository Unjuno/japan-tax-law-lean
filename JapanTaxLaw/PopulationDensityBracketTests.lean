import JapanTaxLaw.PopulationDensityBracket

/-!
# PopulationDensityBracket tests — 人口密度区分 smoke checks
Decidable smoke tests, pinned to law 507M60000008043 / revision 507M60000008043_20250425_000000000000000.
25/50/75/100 を境界とする 5 区分。
-/

namespace JapanTaxLaw.PopulationDensityBracket

example : densityRate 24 = 70 := by decide
example : densityRate 25 = 60 := by decide
example : densityRate 50 = 50 := by decide
example : densityRate 75 = 40 := by decide
example : densityRate 100 = 30 := by decide

end JapanTaxLaw.PopulationDensityBracket
