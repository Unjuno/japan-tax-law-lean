import JapanTaxLaw.MedicalCorpCapitalOver50

/-! # MedicalCorpCapitalOver50 tests — 50%境界 (law 332CO0000000043 / art.40の8) -/

namespace JapanTaxLaw.MedicalCorpCapitalOver50

example : exceeds 0 100 = false := by decide
example : exceeds 49 100 = false := by decide
example : exceeds 50 100 = false := by decide
example : exceeds 51 100 = true := by decide
example : threshold 1000 = 500 := by decide
example : exceeds 500 1000 = false := by decide
example : exceeds 501 1000 = true := by decide

end JapanTaxLaw.MedicalCorpCapitalOver50
