import JapanTaxLaw.TrustPensionReserve

/-!
# TrustPensionReserve tests — 法人税法施行令 art.157 第1項 kernel-decide smoke

Decidable smoke checks for the bounded art.157(1) model. Scope limited to
`(第一号 + 第二号) - (第三号 + 第四号)` の saturating 減算と、caller-established
な調整割合（`TaxRate.applyFloor`）の適用。境界（控除 > 加算で 0）、調整割合 0/1、
端数切り捨てを含む。全て `by decide`。これはサンプルであり、
完成・網羅・法的正確性の主張ではない。
-/

namespace JapanTaxLaw.TrustPensionReserveTests

open JapanTaxLaw.TaxFinance
open JapanTaxLaw.TrustPensionReserve

-- ==== trustPensionBase: 控除後金額（saturating） ====

example : trustPensionBase 0 0 0 0 = 0 := by decide
example : trustPensionBase 10 5 3 2 = 10 := by decide
example : trustPensionBase 10 5 4 2 = 9 := by decide
-- 境界: 加算 = 控除 → 0
example : trustPensionBase 10 5 7 8 = 0 := by decide
-- 境界: 控除 > 加算 → 0
example : trustPensionBase 0 0 1 0 = 0 := by decide
example : trustPensionBase 10 5 8 9 = 0 := by decide
example : trustPensionBase 1 2 3 4 = 0 := by decide

-- ==== trustPensionReserve: 調整割合（caller-established TaxRate） ====

-- 調整割合 0 → 0
example : trustPensionReserve 10 5 3 2 (⟨0, 100, by decide⟩ : TaxRate) = 0 := by decide
-- 調整割合 1 (100/100) → 基準額そのもの
example : trustPensionReserve 10 5 3 2 (⟨100, 100, by decide⟩ : TaxRate) = 10 := by decide
-- 調整割合 1.07 (107/100): 10 * 107 / 100 = 10（端数 0.7 を切り捨て）
example : trustPensionReserve 10 5 3 2 (⟨107, 100, by decide⟩ : TaxRate) = 10 := by decide
-- 端数: base 3, 1/2 → 3 * 1 / 2 = 1（1.5 を切り捨て）
example : trustPensionReserve 1 2 0 0 (⟨1, 2, by decide⟩ : TaxRate) = 1 := by decide
-- 端数: base 230, 3/7 → 230 * 3 / 7 = 98（98.57… を切り捨て）
example : trustPensionReserve 100 200 50 20 (⟨3, 7, by decide⟩ : TaxRate) = 98 := by decide
-- 控除 > 加算 → 基準額 0 なので調整割合によらず 0
example : trustPensionReserve 10 5 8 9 (⟨107, 100, by decide⟩ : TaxRate) = 0 := by decide
example : trustPensionReserve 10 5 8 9 (⟨0, 100, by decide⟩ : TaxRate) = 0 := by decide
-- ゼロ入力
example : trustPensionReserve 0 0 0 0 (⟨107, 100, by decide⟩ : TaxRate) = 0 := by decide

end JapanTaxLaw.TrustPensionReserveTests
