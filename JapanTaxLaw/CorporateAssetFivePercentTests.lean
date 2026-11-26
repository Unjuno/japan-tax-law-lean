import JapanTaxLaw.CorporateAssetFivePercent

/-! # CorporateAssetFivePercent tests — 5%算定 (law 340CO0000000097 / art.155の8) -/

namespace JapanTaxLaw.CorporateAssetFivePercent

example : amount 0 = 0 := by decide
example : amount 1 = 0 := by decide
example : amount 99 = 4 := by decide
example : amount 100 = 5 := by decide
example : amount 101 = 5 := by decide
example : amount 1_000 = 50 := by decide
example : amount 10_001 = 500 := by decide

end JapanTaxLaw.CorporateAssetFivePercent
