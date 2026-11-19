import JapanTaxLaw.LightOilBaseTax

/-!
# LightOilBaseTax tests — 軽油引取税法施行令 art. 23の2 smoke checks

Decidable smoke tests, pinned to

  Law id: 337M50000008017
  Revision: 337M50000008017_20260724_508M60000008092

境界（数量 0）、四捨五入の切り捨て／切り上げ（0.5 は切り上げ）、
指定都市控除で 0（saturating）を kernel-decide で確認する。
数量・率・各指定都市額・該当性はすべて caller-established とし、ここでは何も推定しない。
Bool は関数選択にのみ使い、金額式には入れない。
別表第十一条の率・第三十八条の額算定は NOT MODELLED。
-/

namespace JapanTaxLaw.LightOilBaseTax

open JapanTaxLaw.TaxFinance

-- ==== 法定額定数（一一、二五〇円） ====

example : lightOilBaseAmount = 11_250 := by decide
example : 0 < lightOilBaseAmount := by decide

-- ==== 四捨五入 roundDiv の境界 ====

-- 0 / 切り捨て / 切り上げ / 0.5 切り上げ / exact
example : roundDiv 0 3 = 0 := by decide
example : roundDiv 1 3 = 0 := by decide
example : roundDiv 2 3 = 1 := by decide
example : roundDiv 1 2 = 1 := by decide
example : roundDiv 3 2 = 2 := by decide
example : roundDiv 5 2 = 3 := by decide
example : roundDiv 4 2 = 2 := by decide

-- ==== 率適用後の四捨五入 roundKiloliter ====

example : roundKiloliter 0 ⟨7, 3, by decide⟩ = 0 := by decide
example : roundKiloliter 1 ⟨1, 2, by decide⟩ = 1 := by decide
example : roundKiloliter 2 ⟨1, 2, by decide⟩ = 1 := by decide
example : roundKiloliter 3 ⟨1, 2, by decide⟩ = 2 := by decide
example : roundKiloliter 5 ⟨1, 2, by decide⟩ = 3 := by decide
example : roundKiloliter 1 ⟨1, 3, by decide⟩ = 0 := by decide
example : roundKiloliter 2 ⟨1, 3, by decide⟩ = 1 := by decide

-- ==== 基準税額 = 11,250 × 四捨五入後数量 ====

-- 数量 0 の境界
example : lightOilBaseTax 0 ⟨1, 1, by decide⟩ = 0 := by decide
example : lightOilBaseTax 0 ⟨7, 3, by decide⟩ = 0 := by decide
-- 基本値
example : lightOilBaseTax 1 ⟨1, 1, by decide⟩ = 11_250 := by decide
example : lightOilBaseTax 1 ⟨1, 2, by decide⟩ = 11_250 := by decide  -- 0.5 → 1 kL
example : lightOilBaseTax 2 ⟨1, 3, by decide⟩ = 11_250 := by decide  -- 0.667 → 1 kL
example : lightOilBaseTax 1 ⟨1, 3, by decide⟩ = 0 := by decide        -- 0.333 → 0 kL
example : lightOilBaseTax 3 ⟨1, 2, by decide⟩ = 22_500 := by decide   -- 1.5 → 2 kL

-- ==== 指定都市控除（saturating 減算） ====

example : designatedCityDeduction [] = 0 := by decide
example : designatedCityDeduction [100, 200, 300] = 600 := by decide
example : lightOilBaseTaxAfterDesignatedCityDeduction 1 ⟨1, 1, by decide⟩ [] = 11_250 := by decide
example : lightOilBaseTaxAfterDesignatedCityDeduction 1 ⟨1, 1, by decide⟩ [200] = 11_050 := by decide
-- 控除でちょうど 0
example : lightOilBaseTaxAfterDesignatedCityDeduction 1 ⟨1, 1, by decide⟩ [11_250] = 0 := by decide
-- 控除が基準税額を超えても 0（saturating）
example : lightOilBaseTaxAfterDesignatedCityDeduction 1 ⟨1, 1, by decide⟩ [20_000] = 0 := by decide
example : lightOilBaseTaxAfterDesignatedCityDeduction 1 ⟨1, 1, by decide⟩ [6_000, 6_000] = 0 := by decide

-- ==== Bool は関数選択にのみ使用（金額式には入れない） ====

example : baseTaxFor true 1 ⟨1, 1, by decide⟩ [11_250] = 0 := by decide
example : baseTaxFor false 1 ⟨1, 1, by decide⟩ [11_250] = 11_250 := by decide
example : baseTaxFor true 1 ⟨1, 1, by decide⟩ [] = 11_250 := by decide
example : baseTaxFor false 1 ⟨1, 1, by decide⟩ [20_000] = 11_250 := by decide

end JapanTaxLaw.LightOilBaseTax
