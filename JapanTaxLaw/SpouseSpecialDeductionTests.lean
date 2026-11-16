import JapanTaxLaw.SpouseSpecialDeduction

/-!
# SpouseSpecialDeduction tests — art. 34(1)第十号の二 smoke checks

Decidable smoke tests for the spouse special deduction, pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- （１）spouse ≤ ¥1,000,000、tp ≤ ¥9,000,000 → ¥330,000
example : spouseSpecialDeduction ⟨0, 0, true, false⟩ = 330_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_000_000, true, false⟩ = 330_000 := by decide
-- （２）spouse ¥1,000,000 超〜¥1,300,000 → ¥380,000 − taper
example : spouseSpecialDeduction ⟨9_000_000, 1_000_001, true, false⟩ = 360_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_050_000, true, false⟩ = 310_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_100_000, true, false⟩ = 260_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_200_000, true, false⟩ = 160_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_300_000, true, false⟩ = 60_000 := by decide
-- （３）spouse > ¥1,300,000 → ¥30,000
example : spouseSpecialDeduction ⟨9_000_000, 1_300_001, true, false⟩ = 30_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_330_000, true, false⟩ = 30_000 := by decide
-- 百三十三万円超 → 適格外
example : spouseSpecialDeduction ⟨9_000_000, 1_330_001, true, false⟩ = 0 := by decide
-- ロ: tp > ¥9,000,000 は base × 2/3（¥10,000 切り上げ）
example : spouseSpecialDeduction ⟨9_000_001, 500_000, true, false⟩ = 220_000 := by decide
example : spouseSpecialDeduction ⟨9_250_000, 1_000_001, true, false⟩ = 240_000 := by decide
example : spouseSpecialDeduction ⟨9_500_000, 500_000, true, false⟩ = 220_000 := by decide
-- ハ: tp > ¥9,500,000 は base × 1/3（¥10,000 切り上げ）
example : spouseSpecialDeduction ⟨9_500_001, 500_000, true, false⟩ = 110_000 := by decide
example : spouseSpecialDeduction ⟨9_750_000, 1_000_001, true, false⟩ = 120_000 := by decide
example : spouseSpecialDeduction ⟨10_000_000, 1_100_000, true, false⟩ = 90_000 := by decide
-- tp > ¥10,000,000 → 適格外
example : spouseSpecialDeduction ⟨10_000_001, 500_000, true, false⟩ = 0 := by decide
-- caller flags: 控除対象配偶者／除外字 → 適格外
example : spouseSpecialDeduction ⟨0, 500_000, false, false⟩ = 0 := by decide
example : spouseSpecialDeduction ⟨0, 500_000, true, true⟩ = 0 := by decide
-- roundUpToTenThousand
example : roundUpToTenThousand 0 = 0 := by decide
example : roundUpToTenThousand 1 = 10_000 := by decide
example : roundUpToTenThousand 110_000 = 110_000 := by decide
example : roundUpToTenThousand 253_333 = 260_000 := by decide
example : roundUpToTenThousand 126_666 = 130_000 := by decide

end JapanTaxLaw
