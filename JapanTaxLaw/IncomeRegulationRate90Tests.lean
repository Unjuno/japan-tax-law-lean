import JapanTaxLaw.IncomeRegulationRate90

/-! # IncomeRegulationRate90 tests — 90% (law 340M50000040011 / art.90の2) -/

namespace JapanTaxLaw.IncomeRegulationRate90

example : statutoryRate = 90 := by decide
example : statutoryRate * rateDen = 90 * 100 := by decide
example : statutoryRate > 0 := by decide
example : statutoryRate < rateDen := by decide
example : statutoryRate + 10 = rateDen := by decide

end JapanTaxLaw.IncomeRegulationRate90
