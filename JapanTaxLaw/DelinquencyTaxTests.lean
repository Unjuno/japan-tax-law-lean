import JapanTaxLaw.DelinquencyTax

/-!
# DelinquencyTax tests — 国税通則法 art. 60 smoke checks

Decidable smoke tests, pinned to
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 60(2): 年率
example : delinquencyLowRate = ⟨73, 1000, by decide⟩ := by rfl
example : delinquencyHighRate = ⟨146, 1000, by decide⟩ := by rfl
-- 高率は低率の2倍
example : delinquencyHighRate.num = 2 * delinquencyLowRate.num := by rfl
-- 期間区分（ただし書）
example : delinquencyRate true = delinquencyLowRate := by rfl
example : delinquencyRate false = delinquencyHighRate := by rfl

-- ==== kernel-decided boundary checks (pinned rates via TaxRate.applyFloor) ====
-- 零入力: 未納税額 0 円に低率 73/1000 を適用 → 0 * 73 / 1000 = 0（下限境界）
example : delinquencyLowRate.applyFloor 0 = 0 := by decide
-- 小額正入力: 13 円に高率 146/1000 を適用 → 13 * 146 = 1898、1898 / 1000 = 1 円（切り捨て）
example : delinquencyHighRate.applyFloor 13 = 1 := by decide

end JapanTaxLaw
