import JapanTaxLaw.CorporateSpecialTaxBase

/-!
# CorporateSpecialTaxBase tests — 法人特別税法 art.9 smoke checks

Decidable smoke tests, pinned to law 404AC0000000015 /
revision 404AC0000000015_20010401_413AC0000000006.

境界: 年400万円控除 saturating、月割り除算先行・切り捨て、月数境界。
有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.CorporateSpecialTaxBase

-- 年控除額の定数
example : annualDeduction = 4_000_000 := by decide
-- 1年: 基準1000万 → 600万
example : standardTaxBase 10_000_000 = 6_000_000 := by decide
-- saturating: 基準 < 400万 → 0
example : standardTaxBase 3_999_999 = 0 := by decide
example : standardTaxBase 4_000_000 = 0 := by decide
example : standardTaxBase 0 = 0 := by decide
-- 月割り: 4,000,000/12 = 333,333（切り捨て）
example : partialDeduction 1 = 333_333 := by decide
example : partialDeduction 6 = 1_999_998 := by decide
example : partialDeduction 12 = 3_999_996 := by decide
-- 月割り課税標準
example : partialTaxBase 10_000_000 6 = 8_000_002 := by decide
example : partialTaxBase 1_000 1 = 0 := by decide

end JapanTaxLaw.CorporateSpecialTaxBase
