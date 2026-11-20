import JapanTaxLaw.CustomsSimilarGoods

/-!
# CustomsSimilarGoods tests — 関税定率法 art. 4の2 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 双方あるときは同種を優先
example : selectedSimilarGoodsPrice (some 1_000_000) (some 900_000) = some 1_000_000 := by decide
-- 同種のみ / 類似のみ
example : selectedSimilarGoodsPrice (some 1_000_000) none = some 1_000_000 := by decide
example : selectedSimilarGoodsPrice none (some 900_000) = some 900_000 := by decide
-- 双方なし（次の算定手段へ委ねる）
example : selectedSimilarGoodsPrice none none = none := by decide
-- 境界: 0円の同種価格も「ある」として扱う
example : selectedSimilarGoodsPrice (some 0) (some 900_000) = some 0 := by decide
-- 境界: 小さい正の入力 (1..13) — 同種優先 / 類似フォールバック
example : selectedSimilarGoodsPrice (some 7) (some 900_000) = some 7 := by decide
example : selectedSimilarGoodsPrice none (some 13) = some 13 := by decide

end JapanTaxLaw
