import JapanTaxLaw.QualifiedInvoiceTaxAmount

/-!
# QualifiedInvoiceTaxAmount tests — 消費税法施行令 art.70の10 smoke checks

Decidable smoke tests, pinned to law 363CO0000000360 /
revision 363CO0000000360_20261101_507CO0000000125.

確認: 百分の十/八、百十分の十/百八分の八、軽減対象の別、端数。
有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.QualifiedInvoiceTaxAmount

-- 方法1 税抜: 10/100, 8/100
example : fromExclusive 1000 standardRateExclusive = 100 := by decide
example : fromExclusive 1000 reducedRateExclusive = 80 := by decide
example : fromExclusive 0 standardRateExclusive = 0 := by decide
example : fromExclusive 12345 standardRateExclusive = 1234 := by decide
-- 方法2 税込: 10/110, 8/108
example : fromInclusive 1100 standardRateInclusive = 100 := by decide
example : fromInclusive 1080 reducedRateInclusive = 80 := by decide
example : fromInclusive 0 standardRateInclusive = 0 := by decide
-- 税率定数の分母確認（10倍誤りでない）
example : standardRateInclusive.den = 110 := by decide
example : reducedRateInclusive.den = 108 := by decide
example : standardRateExclusive.den = 100 := by decide
example : reducedRateExclusive.den = 100 := by decide

end JapanTaxLaw.QualifiedInvoiceTaxAmount
