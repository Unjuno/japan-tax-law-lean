import JapanTaxLaw.SpecialMeasuresRate50

/-! # SpecialMeasuresRate50 tests — 50% (law 332M50000040015 / art.12) -/

namespace JapanTaxLaw.SpecialMeasuresRate50

example : statutoryRate = 50 := by decide
example : statutoryRate * rateDen = 50 * 100 := by decide
example : statutoryRate > 0 := by decide
example : statutoryRate < rateDen := by decide
example : statutoryRate + 50 = rateDen := by decide

end JapanTaxLaw.SpecialMeasuresRate50
