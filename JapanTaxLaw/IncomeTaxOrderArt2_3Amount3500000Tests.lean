import JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000Spec

/-!
# IncomeTaxOrderArt2_3Amount3500000 tests — kernel-decided checks

Pinned to law 332CO0000000043 / revision 332CO0000000043_20261101_507CO0000000127.
境界: 3000000 / 3500000（読替前後の金額）。
-/

namespace JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000

example : appliedAmount 0 = 500000 := by decide
example : appliedAmount 1 = 500001 := by decide
example : appliedAmount 3000000 = 3500000 := by decide
example : specApplied 3500000 = 4000000 := by decide
example : originalAmount = specOriginal := by decide
example : substitutedAmount = specSubstituted := by decide
example : addedAmount = 500000 := by decide
example : addedAmount = 499999 + 1 := by decide
example : addedAmount = 500001 - 1 := by decide
example : specApplied 0 = appliedAmount 0 := by decide

end JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000
