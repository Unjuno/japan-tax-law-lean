import JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30kSpec

/-!
# SpecialTaxOrderArt80CapitalFeeFloor30k tests — kernel-decided boundary checks

Pinned to law 332AC0000000026 / revision 332AC0000000026_20261101_507AC0000000013.
境界: 8,571,428円（computed が 30,000 を跨ぐ点）と 999/1000/1001。
-/

namespace JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k

example : feePerApplication 0 = 30000 := by decide
example : feePerApplication 1 = 30000 := by decide
example : computedFee 1_000_000 = 3500 := by decide
example : feePerApplication 1_000_000 = 30000 := by decide
example : computedFee 8_571_428 = 29999 := by decide
example : feePerApplication 8_571_428 = 30000 := by decide
example : computedFee 8_571_429 = 30000 := by decide
example : feePerApplication 10_000_000 = 35000 := by decide
example : specFee 8_571_428 = feePerApplication 8_571_428 := by decide
example : specFee 10_000_000 = feePerApplication 10_000_000 := by decide
example : computedFee 999 = 3 := by decide
example : computedFee 1000 = 3 := by decide
example : computedFee 1001 = 3 := by decide
example : rateNumerator = 3 * 10 + 5 := by decide
example : rateDenominator = 1000 * 10 := by decide

end JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k
