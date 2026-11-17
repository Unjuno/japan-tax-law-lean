import JapanTaxLaw.CustomsDamageReduction

/-!
# CustomsDamageReduction tests — 関税定率法 art. 10(1) smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def rate10 : TaxRate := ⟨10, 100, by decide⟩

-- art. 10(1): 低下率基準の軽減額
example : depreciationReduction 1_000_000 rate10 = 100_000 := by decide
example : depreciationReduction 0 rate10 = 0 := by decide
-- 差額上限
example : reductionCap 1_000_000 850_000 = 150_000 := by decide
example : reductionCap 800_000 900_000 = 0 := by decide
-- 差額以内判定
example : reductionWithinCap 1_000_000 850_000 rate10 = true := by decide
example : reductionWithinCap 1_000_000 950_000 rate10 = false := by decide

end JapanTaxLaw
