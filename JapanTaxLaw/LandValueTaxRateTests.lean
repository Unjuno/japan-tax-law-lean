import JapanTaxLaw.LandValueTaxRate

/-!
# LandValueTaxRate tests — 地価税法 art. 22 smoke checks

Decidable kernel smoke tests for the art. 22 model, pinned to
  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068

Boundaries: base=0, base=deduction, base<deduction, and fractions.
-/

namespace JapanTaxLaw.LandValueTaxRate

open JapanTaxLaw.TaxFinance

-- ===== 課税価格 = 0 =====
example : landValueTax 0 0 = 0 := by decide
example : landValueTax 0 500 = 0 := by decide
example : landValueTax 0 1_000_000 = 0 := by decide

-- ===== 課税価格 = 基礎控除 =====
example : landValueTax 500 500 = 0 := by decide
example : landValueTax 1_000 1_000 = 0 := by decide
example : landValueTax 1_000_000 1_000_000 = 0 := by decide

-- ===== 課税価格 < 基礎控除 (saturating) =====
example : landValueTax 499 500 = 0 := by decide
example : landValueTax 1 1_000_000 = 0 := by decide
example : landValueTax 999_999 1_000_000 = 0 := by decide

-- ===== exact multiples / 端数 (truncation) =====
example : landValueTax 1_000 0 = 3 := by decide
example : landValueTax 3_000 1_000 = 6 := by decide
example : landValueTax 1_000_000 999_000 = 3 := by decide
example : landValueTax 100 0 = 0 := by decide       -- 300/1000 -> 0
example : landValueTax 334 0 = 1 := by decide       -- 1002/1000 -> 1
example : landValueTax 999 0 = 2 := by decide       -- 2997/1000 -> 2

end JapanTaxLaw.LandValueTaxRate
