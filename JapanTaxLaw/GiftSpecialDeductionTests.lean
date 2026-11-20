import JapanTaxLaw.GiftSpecialDeduction

/-!
# GiftSpecialDeduction tests — 相続税法 art. 21の12 smoke checks

Decidable smoke tests, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 21の12: 控除額 = min(2500万 − 既控除, 控除後課税価格)
example : giftSpecialDeductionLimit = 25_000_000 := by rfl
example : giftSpecialDeduction 10_000_000 0 = 10_000_000 := by decide
example : giftSpecialDeduction 30_000_000 0 = 25_000_000 := by decide
example : giftSpecialDeduction 20_000_000 10_000_000 = 15_000_000 := by decide
-- 既控除が上限に達すると控除額 0
example : giftSpecialDeduction 20_000_000 25_000_000 = 0 := by decide
example : giftSpecialDeduction 20_000_000 30_000_000 = 0 := by decide
-- 境界: 課税価格 0
example : giftSpecialDeduction 0 0 = 0 := by decide

-- 追加の境界: 小さい正の入力 (1..13) — min(2500万 − 0, 7) = 7（控除額＝課税価格の単位元）
example : giftSpecialDeduction 7 0 = 7 := by decide

end JapanTaxLaw
