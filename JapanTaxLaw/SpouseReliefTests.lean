import JapanTaxLaw.SpouseRelief

/-!
# SpouseRelief tests — 相続税法 art. 19-2 （配偶者軽減） smoke checks

Decidable smoke tests for the art. 19-2 model, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 19-2(2) イ basis: share < 1.6億 → floor ¥160,000,000
example : spouseReliefYiBasis ⟨90_000_000, 80_000_000, 300_000_000, 30_000_000, false⟩
    = 160_000_000 := by decide

-- art. 19-2(2) イ basis: share ≥ 1.6億 → use share
example : spouseReliefYiBasis ⟨250_000_000, 240_000_000, 500_000_000, 80_000_000, false⟩
    = 250_000_000 := by decide

-- spouse-only heir: イ = total acquisition
example : spouseReliefYiBasis ⟨0, 400_000_000, 400_000_000, 100_000_000, true⟩
    = 400_000_000 := by decide

-- 二号： ratio relevant = ロ when ロ smaller
example : spouseReliefRelevantBasis ⟨100_000_000, 90_000_000, 300_000_000, 30_000_000, false⟩
    = 90_000_000 := by decide

-- 二号： ratio relevant = イ when イ smaller
example : spouseReliefRelevantBasis ⟨200_000_000, 250_000_000, 400_000_000, 10_000_000, false⟩
    = 200_000_000 := by decide

-- spouse-only heir: relevant = total
example : spouseReliefRelevantBasis ⟨0, 400_000_000, 400_000_000, 100_000_000, true⟩
    = 400_000_000 := by decide

-- common case: floor active, 1.6億/400M = 40% × 10,000,000 = 4,000,000 relief
example : spouseRelief ⟨100_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩
    = 4_000_000 := by decide

-- share wins: min(¥200,000,000,¥250,000,000)=200,000,000, ratio=50%, relief=5,000,000
example : spouseRelief ⟨200_000_000, 250_000_000, 400_000_000, 10_000_000, false⟩
    = 5_000_000 := by decide

-- spouse-only heir: relief equals full tax
example : spouseRelief ⟨50_000_000, 400_000_000, 400_000_000, 100_000_000, true⟩
    = 100_000_000 := by decide

-- tax subtraction semantics (carrying into art. 20 deduction flow)
example : taxAfterSpouseRelief ⟨200_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩
    = 5_000_000 := by decide

-- 1.6億 floor: precise boundary halves
example : spouseRelief ⟨160_000_000, 300_000_000, 400_000_000, 100_000_000, false⟩
    = 40_000_000 := by decide
  -- min(¥160,000,000,¥300_000_000)=160M, ratio=40%, 40%×100M=40M

example : spouseRelief ⟨160_000_001, 300_000_000, 400_000_000, 100_000_001, false⟩
    > 0 := by decide  -- tax is positive once relief > 0

end JapanTaxLaw
