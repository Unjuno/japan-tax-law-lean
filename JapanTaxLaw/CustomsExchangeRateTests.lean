import JapanTaxLaw.CustomsExchangeRate

/-!
# CustomsExchangeRate tests — 関税定率法 art. 4の7 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

-- art. 4の7: 換算日の選択
example : exchangeRateDate false 100 200 = 100 := by decide  -- 通常は輸入申告の日
example : exchangeRateDate true 100 200 = 200 := by decide   -- 第五条第一号貨物は同号の日
example : exchangeRateDate false 0 200 = 0 := by decide
example : exchangeRateDate true 100 100 = 100 := by decide
-- 境界: 小さい正の入力 (1..13)
example : exchangeRateDate false 7 200 = 7 := by decide
example : exchangeRateDate true 200 13 = 13 := by decide

end JapanTaxLaw
