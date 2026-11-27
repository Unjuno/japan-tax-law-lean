import JapanTaxLaw.SpecialTaxOrderArt124Rate25To8Spec

/-!
# SpecialTaxOrderArt124Rate25To8 tests — kernel-decided boundary checks

Pinned to law 332AC0000000026 / revision 332AC0000000026_20261101_507AC0000000013.
境界: 24/25（読替え前後の分子）と 999/1000/1001（千分率の分母）。
-/

namespace JapanTaxLaw.SpecialTaxOrderArt124Rate25To8

example : appliedAmount 0 = 0 := by decide
example : appliedAmount 1 = 0 := by decide
example : appliedAmount 24 = 0 := by decide
example : appliedAmount 25 = 0 := by decide
example : appliedAmount 125 = 1 := by decide
example : appliedAmount 999 = 7 := by decide
example : appliedAmount 1000 = 8 := by decide
example : appliedAmount 1001 = 8 := by decide
example : specApplied 1000 = appliedAmount 1000 := by decide
example : specApplied 1001 = appliedAmount 1001 := by decide

end JapanTaxLaw.SpecialTaxOrderArt124Rate25To8
