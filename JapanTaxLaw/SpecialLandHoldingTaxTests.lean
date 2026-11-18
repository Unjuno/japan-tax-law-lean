import JapanTaxLaw.SpecialLandHoldingTax

/-!
# SpecialLandHoldingTax tests — 地方税法 art. 596 kernel-decide smoke checks

Decidable kernel smoke tests for the art. 596 model, pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002

Boundaries: 控除 0, 控除 ≥ 税額 (結果 0), 端数 (切り捨て),
一号 14/1000 と二号/三号 4/100 の転記確認, 各号 def。
-/


namespace JapanTaxLaw.SpecialLandHoldingTax

open JapanTaxLaw.TaxFinance

-- ===== 控除率の転記確認（10 倍誤り detecting smoke） =====

-- 一号: 百分の一・四 = 14/1000 → 価格 1000 の控除は 14（14/100 なら 140 で誤り）
example : fixedAssetDeductionRate.applyFloor 1000 = 14 := by decide
example : fixedAssetDeductionRate.applyFloor 500 = 7 := by decide
-- 二号/三号: 百分の四 = 4/100 → 価格 1000 の控除は 40（4/1000 なら 4 で誤り）
example : realEstateDeductionRate.applyFloor 1000 = 40 := by decide
example : realEstateDeductionRate.applyFloor 250 = 10 := by decide

-- ===== 控除 0 → 結果 = 税額 =====

example : landHoldingTax ⟨14, 1000, by decide⟩ 1000 fixedAssetDeductionRate 0 = 14 := by decide
example : landHoldingTax ⟨1, 100, by decide⟩ 10_000 realEstateDeductionRate 0 = 100 := by decide
example : landHoldingTax ⟨1, 100, by decide⟩ 0 fixedAssetDeductionRate 500 = 0 := by decide

-- ===== 控除 ≥ 税額 → 結果 0（税額を限度とする） =====

example : landHoldingTax ⟨14, 1000, by decide⟩ 10 fixedAssetDeductionRate 10_000 = 0 := by decide
example : landHoldingTax ⟨4, 100, by decide⟩ 1000 realEstateDeductionRate 100_000 = 0 := by decide
example : landHoldingTax ⟨1, 100, by decide⟩ 1000 fixedAssetDeductionRate 1_000_000 = 0 := by decide

-- ===== 端数（applyFloor の切り捨て） =====

-- 税額の端数: 税率 1/100, base 1050 → 税額 10
example : (⟨1, 100, by decide⟩ : TaxRate).applyFloor 1050 = 10 := by decide
-- 控除の端数: 14/1000, 価格 100 → 1 (1.4 を切り捨て)
example : fixedAssetDeductionRate.applyFloor 100 = 1 := by decide
-- 税額 10 − 控除 1 = 9
example : landHoldingTax ⟨1, 100, by decide⟩ 1000 fixedAssetDeductionRate 100 = 9 := by decide
-- 控除が税額をわずかに下回る境界（税額 10, 控除 9 → 1; 控除 10 → 0）
example : landHoldingTax ⟨1, 100, by decide⟩ 1000 realEstateDeductionRate 249 = 1 := by decide
example : landHoldingTax ⟨1, 100, by decide⟩ 1000 realEstateDeductionRate 250 = 0 := by decide

-- ===== 各号の def（区分は caller-established） =====

example : landHoldingTaxI ⟨14, 1000, by decide⟩ 1000 1000 = 0 := by decide
example : landHoldingTaxI ⟨14, 1000, by decide⟩ 1000 0 = 14 := by decide
example : landHoldingTaxII ⟨4, 100, by decide⟩ 1000 100 = 36 := by decide
example : landHoldingTaxIII ⟨4, 100, by decide⟩ 1000 100 = 36 := by decide
example : landHoldingTaxII ⟨4, 100, by decide⟩ 1000 100_000 = 0 := by decide

end JapanTaxLaw.SpecialLandHoldingTax
