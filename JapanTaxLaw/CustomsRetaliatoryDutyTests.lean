import JapanTaxLaw.CustomsRetaliatoryDuty

/-!
# CustomsRetaliatoryDuty tests — 関税定率法 art. 6 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 6: 追加関税の上限 = 課税価格と同額
example : retaliatoryDutyCap 1_000_000 = 1_000_000 := by decide
example : retaliatoryDutyWithinCap 1_000_000 1_000_000 = true := by decide
example : retaliatoryDutyWithinCap 1_000_000 999_999 = true := by decide
example : retaliatoryDutyWithinCap 1_000_000 1_000_001 = false := by decide
-- 境界: 0
example : retaliatoryDutyWithinCap 0 0 = true := by decide
example : retaliatoryDutyWithinCap 0 1 = false := by decide

end JapanTaxLaw
