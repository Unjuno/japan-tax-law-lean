import JapanTaxLaw.NonpaymentSurcharge

/-!
# NonpaymentSurcharge tests — 国税通則法 art. 67 smoke checks

Decidable smoke tests, pinned to
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 67(1): 税額 × 10%
example : nonpaymentSurcharge 100_000 false = 10_000 := by decide
example : nonpaymentSurcharge 50_000 false = 5_000 := by decide
-- art. 67(2): 税額 × 5%（軽減）
example : nonpaymentSurcharge 100_000 true = 5_000 := by decide
example : nonpaymentSurcharge 50_000 true = 2_500 := by decide
-- 境界: 0 / 切り捨て
example : nonpaymentSurcharge 0 false = 0 := by decide
example : nonpaymentSurcharge 0 true = 0 := by decide
example : nonpaymentSurcharge 1 false = 0 := by decide
example : nonpaymentSurcharge 19 true = 0 := by decide

end JapanTaxLaw
