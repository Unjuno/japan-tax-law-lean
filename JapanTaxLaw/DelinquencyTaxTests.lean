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

end JapanTaxLaw
