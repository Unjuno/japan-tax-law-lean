import JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5PercentSpec

/-!
# LocalTaxArt71_28DividendTaxRate5Percent tests — kernel-decided checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 99/100/101（5/100 適用）、比率 5:100 の明示検証。
-/

namespace JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent

example : numerator = 5 := by decide
example : denominator = 100 := by decide
example : numerator * 20 = denominator := by decide
example : specNumerator * 20 = specDenominator := by decide
example : dividendTax 0 = 0 := by decide
example : dividendTax 99 = 4 := by decide
example : dividendTax 100 = 5 := by decide
example : dividendTax 101 = 5 := by decide
example : specTax 100 = 5 := by decide
example : dividendTax 12345 = specTax 12345 := by decide

end JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent
