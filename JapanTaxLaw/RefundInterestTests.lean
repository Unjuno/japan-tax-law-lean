import JapanTaxLaw.RefundInterest

/-!
# RefundInterest tests — 国税通則法 art. 58 smoke checks

Decidable smoke tests, pinned to
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 58(1): 利率 年7.3%
example : refundInterestRate = ⟨73, 1000, by decide⟩ := by rfl
-- art. 60 の低率と同一
example : refundInterestRate = delinquencyLowRate := by rfl
-- art. 58(2)一: 差押控除期間 7日
example : attachmentExclusionDays = 7 := by decide

-- ==== kernel-decided boundary checks (pinned rate 73/1000 via TaxRate.applyFloor/applyCeil) ====
-- (a) 零入力: 0 円 × 73/1000 → 0 * 73 / 1000 = 0（下限境界）
example : refundInterestRate.applyFloor 0 = 0 := by decide
-- (b) 小さい正の入力 (1..13): 13 円 × 73/1000 → 13 * 73 = 949, 949 / 1000 = 0（切捨てで飽和）
example : refundInterestRate.applyFloor 13 = 0 := by decide
-- (c) 単位元境界: 1 円に 73/1000 を切り上げ適用 → (1*73 + 999) / 1000 = 1 = 入力（結果=入力）
example : refundInterestRate.applyCeil 1 = 1 := by decide

end JapanTaxLaw
