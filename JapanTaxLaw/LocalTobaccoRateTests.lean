import JapanTaxLaw.LocalTobaccoRateSpec

/-! Regression tests — 地方税法 74条の5 (たばこ税 千七十円/千本). -/

namespace JapanTaxLaw.LocalTobaccoRate

example : ratePerThousand = 1_070 := by decide
example : tobaccoTaxYen 0 = 0 := by decide
example : tobaccoTaxYen 1 = 1_070 := by decide
example : tobaccoTaxYen 2 = 2_140 := by decide
example : tobaccoTaxYen 100 = 107_000 := by decide

example : tobaccoTaxYen 0 = specTobaccoTaxYen 0 := agreeTobaccoRate 0
example : tobaccoTaxYen 7 = specTobaccoTaxYen 7 := agreeTobaccoRate 7
example : specTobaccoTaxYen 3 ≤ specTobaccoTaxYen 9 := spec_monotone 3 9 (by decide)

end JapanTaxLaw.LocalTobaccoRate
