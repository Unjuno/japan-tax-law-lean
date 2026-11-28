import JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4Spec

/-!
# LocalTaxArt350FixedAssetStandardRate1p4 tests — kernel-decided boundary checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 499/500（1.4% の切捨て）と 999/1000/1001（分母）。
-/

namespace JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4

example : rateApplied 0 = 0 := by decide
example : rateApplied 1 = 0 := by decide
example : rateApplied 499 = 6 := by decide
example : rateApplied 500 = 7 := by decide
example : rateApplied 13 = 0 := by decide
example : rateApplied 14 = 0 := by decide
example : rateApplied 15 = 0 := by decide
example : rateApplied 999 = 13 := by decide
example : rateApplied 1000 = 14 := by decide
example : rateApplied 1001 = 14 := by decide
example : specApplied 500 = rateApplied 500 := by decide
example : specApplied 1001 = rateApplied 1001 := by decide
example : rateNumerator = specNum := by decide

end JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4
