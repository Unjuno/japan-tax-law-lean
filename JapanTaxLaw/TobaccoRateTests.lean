import JapanTaxLaw.TobaccoRate

/-!
# TobaccoRate tests — たばこ税法 art.11 smoke checks
Decidable smoke tests, pinned to law 359AC0000000072 / revision 359AC0000000072_20260525_506AC0000000052.
税率 6802 円/千本、0/1/10/100 千本。
-/

namespace JapanTaxLaw.TobaccoRate

example : ratePerThousandYen = 6_802 := by decide
example : tobaccoTaxYen 0 = 0 := by decide
example : tobaccoTaxYen 1 = 6_802 := by decide
example : tobaccoTaxYen 2 = 13_604 := by decide
example : tobaccoTaxYen 10 = 68_020 := by decide
example : tobaccoTaxYen 100 = 680_200 := by decide

end JapanTaxLaw.TobaccoRate
