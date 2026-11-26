import JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75kSpec

/-!
# SpecialTaxOrderArt80CapitalFeeFloor75k tests — kernel-decided boundary checks

Pinned to law 332AC0000000026 / revision 332AC0000000026_20261101_507AC0000000013.
境界: 資本金 20,000,000（computed 70,000 < 下限）と 21,000,000（computed 73,500）。
-/

namespace JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k

example : feePerApplication 0 = 75000 := by decide
example : feePerApplication 1 = 75000 := by decide
example : computedFee 20_000_000 = 70000 := by decide
example : feePerApplication 20_000_000 = 75000 := by decide
example : computedFee 21_000_000 = 73500 := by decide
example : feePerApplication 30_000_000 = 105000 := by decide
example : specFee 20_000_000 = 75000 := by decide
example : specFee 30_000_000 = feePerApplication 30_000_000 := by decide
example : computedFee 999 = 3 := by decide
example : computedFee 1000 = 3 := by decide
example : computedFee 1001 = 3 := by decide
example : rateNumerator = 3 * 10 + 5 := by decide
example : rateDenominator = 1000 * 10 := by decide

end JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k
