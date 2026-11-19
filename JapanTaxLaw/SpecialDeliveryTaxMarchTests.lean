import JapanTaxLaw.SpecialDeliveryTaxMarch

/-!
# SpecialDeliveryTaxMarch tests — 特別交付税省令 art.10 smoke checks

Decidable smoke tests, pinned to 法 id 351M50000008035 / revision 351M50000008035_20260316_508M60000008025.

境界: 〇・八/〇・七 の 10 倍誤り、四捨五入 500 境界、控除 saturating、
合算額、率 1/1。有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.SpecialDeliveryTaxMarch

-- 率の 10 倍誤り検出
example : scaledSurvey 1000 rate08 = 800 := by decide   -- 8000 でない
example : scaledSurvey 1000 rate07 = 700 := by decide   -- 7000 でない
example : scaledSurvey 1000 rateOne = 1000 := by decide

-- 四捨五入の境界
example : roundToThousand 499 = 0 := by decide
example : roundToThousand 500 = 1000 := by decide
example : roundToThousand 1499 = 1000 := by decide
example : roundToThousand 1500 = 2000 := by decide
example : roundToThousand 0 = 0 := by decide

-- 控除 saturating
example : itemAfterDeduction 100 150 = 0 := by decide
example : itemAfterDeduction 100 100 = 0 := by decide
example : itemAfterDeduction 100 99 = 1 := by decide
example : itemAfterDeduction 0 50 = 0 := by decide

-- 合算額と第四条額
example : totalAddition 10 20 30 40 50 60 70 80 = 360 := by decide
example : marchAmount 100 10 20 30 40 50 60 70 80 = 460 := by decide
example : marchAmount 0 0 0 0 0 0 0 0 0 = 0 := by decide

end JapanTaxLaw.SpecialDeliveryTaxMarch
