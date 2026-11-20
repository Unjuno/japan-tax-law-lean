import JapanTaxLaw.CustomsValueAfterDamage

/-!
# CustomsValueAfterDamage tests — 関税定率法 art. 4の5 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 4の5: 仮想課税価格 − 減価額
example : customsValueAfterDamage 100_000 20_000 = 80_000 := by decide
example : customsValueAfterDamage 500_000 150_000 = 350_000 := by decide
-- 境界: 減価 0 / 減価 = 仮想 / underflow
example : customsValueAfterDamage 100_000 0 = 100_000 := by decide
example : customsValueAfterDamage 100_000 100_000 = 0 := by decide
example : customsValueAfterDamage 10_000 20_000 = 0 := by decide
example : customsValueAfterDamage 0 5_000 = 0 := by decide

-- 追加の必須境界 (b) 小さい正の入力 (1..13) と (c) identity/saturation。
-- ((a) 零入力は上示例で既にカバー。)
example : customsValueAfterDamage 13 5 = 8 := by decide
example : customsValueAfterDamage 13 0 = 13 := by decide  -- 減価 0 → 入力と一致 (identity)
example : customsValueAfterDamage 5 13 = 0 := by decide  -- 減価 > 仮想 → 0 (saturation)

end JapanTaxLaw
