import JapanTaxLaw.ExplorationReserve

/-!
# ExplorationReserve tests — 租税特別措置法施行規則 art.9 smoke checks

Decidable smoke tests, pinned to 法 id 332M50000040015 /
revision 332M50000040015_20261101_507M60000040026.

境界: 分母 0、一号 0、取得額控除 saturating、端数切り捨て、一号>二号。
有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.ExplorationReserve

-- 取得額控除 saturating
example : netSalesAmount 100 150 = 0 := by decide
example : netSalesAmount 100 100 = 0 := by decide
example : netSalesAmount 100 99 = 1 := by decide
example : netSalesAmount 0 50 = 0 := by decide

-- 分母 0 → 0
example : explorationReserve 1000 0 5 0 = 0 := by decide
-- 一号 0 → 0
example : explorationReserve 1000 0 0 10 = 0 := by decide
-- 基本 1/2
example : explorationReserve 1000 0 1 2 = 500 := by decide
-- 取得額控除 1000−200=800, 1/2 → 400
example : explorationReserve 1000 200 1 2 = 400 := by decide
-- 端数切り捨て 100×1/3=33
example : explorationReserve 100 0 1 3 = 33 := by decide
-- 一号>二号（割合>1）: 100×3/2=150
example : explorationReserve 100 0 3 2 = 150 := by decide
-- 売上=取得額 → base 0 → 0
example : explorationReserve 500 500 1 2 = 0 := by decide

end JapanTaxLaw.ExplorationReserve
