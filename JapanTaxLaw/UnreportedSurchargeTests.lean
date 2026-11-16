import JapanTaxLaw.UnreportedSurcharge

/-!
# UnreportedSurcharge tests — 国税通則法 art. 66 smoke checks

Decidable smoke tests, pinned to
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 基本税率（1項）
example : unreportedSurchargeBasicRate false = ⟨15, 100, by decide⟩ := by rfl
example : unreportedSurchargeBasicRate true = ⟨10, 100, by decide⟩ := by rfl

-- 区分税率（3項）
example : tierRate SurchargeTier.upTo500k false = ⟨15, 100, by decide⟩ := by rfl
example : tierRate SurchargeTier.over500kTo3m false = ⟨20, 100, by decide⟩ := by rfl
example : tierRate SurchargeTier.over3m false = ⟨30, 100, by decide⟩ := by rfl
example : tierRate SurchargeTier.over3m true = ⟨25, 100, by decide⟩ := by rfl

-- 三段階累進（3項）— 正常例
example : tieredSurcharge 400_000 false = 60_000 := by decide
example : tieredSurcharge 500_000 false = 75_000 := by decide
example : tieredSurcharge 2_000_000 false = 375_000 := by decide
example : tieredSurcharge 3_000_000 false = 575_000 := by decide
example : tieredSurcharge 4_000_000 false = 875_000 := by decide
-- 軽減時（各 −5pt）
example : tieredSurcharge 400_000 true = 40_000 := by decide
example : tieredSurcharge 4_000_000 true = 675_000 := by decide
-- 境界・0
example : tieredSurcharge 0 false = 0 := by decide
example : tieredSurcharge 1 false = 0 := by decide  -- 切り捨て

end JapanTaxLaw
