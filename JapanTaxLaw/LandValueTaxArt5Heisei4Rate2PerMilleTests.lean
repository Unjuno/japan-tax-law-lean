import JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMilleSpec

/-!
# LandValueTaxArt5Heisei4Rate2PerMille tests — kernel-decided boundary checks

Pinned to law 403AC0000000069 / revision 403AC0000000069_20250601_504AC0000000068.
境界: 999/1000/1001（千分率の分母）と 499/500（千分の二の切捨て境界）。
-/

namespace JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille

example : appliedAmount 0 = 0 := by decide
example : appliedAmount 1 = 0 := by decide
example : appliedAmount 499 = 0 := by decide
example : appliedAmount 500 = 1 := by decide
example : appliedAmount 999 = 1 := by decide
example : appliedAmount 1000 = 2 := by decide
example : appliedAmount 1001 = 2 := by decide
example : specApplied 1000 = appliedAmount 1000 := by decide
example : specApplied 499 = appliedAmount 499 := by decide
example : originalPerMille = 3 := by decide

end JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille
