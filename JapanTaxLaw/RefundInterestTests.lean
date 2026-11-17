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

end JapanTaxLaw
