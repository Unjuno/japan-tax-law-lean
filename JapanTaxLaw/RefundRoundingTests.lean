import JapanTaxLaw.RefundRounding

/-!
# RefundRounding tests — 国税庁関係政令 art.120 smoke checks
Decidable smoke tests, pinned to law 337AC0000000066 / revision 337AC0000000066_20261101_507AC0000000013.
境界: 円未満切捨て、一円未満は一円、百円未満/千円未満、一万円未満。有限領域の smoke。
-/

namespace JapanTaxLaw.RefundRounding

example : truncateYen 12345 10 = 1234 := by decide
example : truncateYen 9 10 = 0 := by decide
example : refundAmount 5 10 = 1 := by decide
example : refundAmount 9 10 = 1 := by decide
example : refundAmount 10 10 = 1 := by decide
example : refundAmount 0 10 = 0 := by decide
example : refundAmount 12345 10 = 1234 := by decide
example : additionAmount 0 = 0 := by decide
example : additionAmount 999 = 0 := by decide
example : additionAmount 1000 = 1000 := by decide
example : additionAmount 12345 = 12300 := by decide
example : baseForAddition 9999 = 0 := by decide
example : baseForAddition 10000 = 10000 := by decide
example : baseForAddition 123456 = 120000 := by decide

end JapanTaxLaw.RefundRounding
