import JapanTaxLaw.SpecialMeasuresRate90

/-! # SpecialMeasuresRate90 tests — 90% (law 332M50000040015 / art.19の5) -/

namespace JapanTaxLaw.SpecialMeasuresRate90

example : statutoryRate = 90 := by decide
example : statutoryRate * rateDen = 90 * 100 := by decide
example : statutoryRate > 0 := by decide
example : statutoryRate < rateDen := by decide
example : statutoryRate + 10 = rateDen := by decide

end JapanTaxLaw.SpecialMeasuresRate90
