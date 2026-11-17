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

end JapanTaxLaw
