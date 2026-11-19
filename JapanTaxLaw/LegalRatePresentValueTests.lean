import JapanTaxLaw.LegalRatePresentValue

/-!
# LegalRatePresentValue tests — 相続税法施行令 art.12の4 smoke checks
Decidable smoke tests, pinned to law 325M50000040017 / revision 325M50000040017_20260901_506M60000040016.
境界: n=0（割合1.000）、法定利率0%、1/(1+r)^n の四捨五入。
有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.LegalRatePresentValue

example : presentValuePerMille 0 100 0 = 1000 := by decide
example : presentValuePerMille 0 100 5 = 1000 := by decide
example : presentValuePerMille 0 10 1 = 1000 := by decide
example : presentValuePerMille 10 100 1 = 909 := by decide
example : presentValuePerMille 10 100 2 = 826 := by decide
example : presentValuePerMille 0 100 1 = 1000 := by decide

end JapanTaxLaw.LegalRatePresentValue
