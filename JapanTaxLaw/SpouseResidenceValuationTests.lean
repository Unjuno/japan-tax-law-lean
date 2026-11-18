import JapanTaxLaw.SpouseResidenceValuation

/-
# SpouseResidenceValuation tests — 相続税法 art. 23の2 smoke checks

Decidable smoke tests, pinned to Law id 325AC0000000073 /
  revision 325AC0000000073_20260401_506AC0000000008 / enforcement 2026-04-01.

境界: 年数0 / 時価0 / 控除>時価で saturating 零 / 割合0・1。
-/

namespace JapanTaxLaw.SpouseResidenceValuation

open JapanTaxLaw.TaxFinance

-- ==== 二号の年数・数 ====

example : remainingYears 30 10 = 20 := by decide
example : remainingYears 10 30 = 0 := by decide  -- 零以下なら零
example : remainingYears 10 10 = 0 := by decide
example : remainingYears 0 0 = 0 := by decide
example : netBuildingYears 30 10 5 = 15 := by decide
example : netBuildingYears 10 30 5 = 0 := by decide
example : yearsRate 15 20 = 0 := by decide       -- 端数切り捨て
example : yearsRate 20 20 = 1 := by decide
example : yearsRate 0 20 = 0 := by decide        -- イが零
example : yearsRate 20 0 = 0 := by decide        -- ロが零

-- ==== 第1項: 配偶者居住権の価額 ====

-- 年数0 → 控除ゼロ → 時価そのまま
example : spouseResidenceValue 1000 0 3 = 1000 := by decide
-- 時価0
example : spouseResidenceValue 0 1 1 = 0 := by decide
-- 割合0
example : spouseResidenceValue 1000 1 0 = 1000 := by decide
-- 割合1: 年数1 で控除 = 時価 → 零
example : spouseResidenceValue 1000 1 1 = 0 := by decide
-- 控除 > 時価 → saturating 零
example : spouseResidenceValue 1000 1 2 = 0 := by decide
example : spouseResidenceValue 7 5 5 = 0 := by decide
-- 時価が残る例
example : spouseResidenceValue 100 1 0 = 100 := by decide

-- ==== 第1項を年数から組み立て ====

example : spouseResidenceValueFrom 1000 30 10 5 1 = 1000 := by decide -- イ=15,ロ=20,数=0
example : spouseResidenceValueFrom 1000 30 10 0 1 = 0 := by decide    -- イ=ロ=20,数=1

-- ==== 第2項〜第4項 ====

example : residenceBuildingValue 1000 300 = 700 := by decide
example : residenceBuildingValue 300 1000 = 0 := by decide  -- saturating
example : landUseRightValue 1000 0 = 1000 := by decide      -- 割合0
example : landUseRightValue 1000 1 = 0 := by decide         -- 割合1
example : landUseRightValue 1000 2 = 0 := by decide         -- saturating
example : landValueAfterUseRight 1000 300 = 700 := by decide
example : landValueAfterUseRight 300 1000 = 0 := by decide

end JapanTaxLaw.SpouseResidenceValuation
