import JapanTaxLaw.ReciprocityRate85PerMille

/-! # ReciprocityRate85PerMille tests — 8.5% (law 337CO0000000227 / art.14) -/

namespace JapanTaxLaw.ReciprocityRate85PerMille

example : statutoryRate = 85 := by decide
example : statutoryRate * 10 = 850 := by decide
example : statutoryRate > 0 := by decide
example : statutoryRate < rateDen := by decide
example : statutoryRate * 2 = 170 := by decide

end JapanTaxLaw.ReciprocityRate85PerMille
