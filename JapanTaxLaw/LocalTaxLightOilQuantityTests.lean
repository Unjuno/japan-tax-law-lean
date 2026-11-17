import JapanTaxLaw.LocalTaxLightOilQuantity

/-!
# LocalTaxLightOilQuantity tests — 地方税法施行令 第四十三条の十三 smoke checks

Decidable smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

境界（0、1、99、100）・端数切り捨て・区分選択（特約業者／元売業者）を
kernel-decide で確認する。10 倍過大バグのガードとして数量 1000 → 3（0.3%）も含む。
量的該当性・課税標準・数量はすべて caller-established とし、ここでは何も推定しない。
-/

namespace JapanTaxLaw.LocalTaxLightOilQuantity

open JapanTaxLaw.TaxFinance

-- ==== 特約業者: 数量 × 1 / 100 ====

-- 境界
example : lightOilReduction 0 = 0 := by decide
example : lightOilReduction 1 = 0 := by decide
example : lightOilReduction 99 = 0 := by decide
example : lightOilReduction 100 = 1 := by decide
example : lightOilReduction 101 = 1 := by decide
-- 端数切り捨て
example : lightOilReduction 150 = 1 := by decide
example : lightOilReduction 199 = 1 := by decide
example : lightOilReduction 200 = 2 := by decide
example : lightOilReduction 999 = 9 := by decide
example : lightOilReduction 1000 = 10 := by decide

-- ==== 元売業者: 数量 × 30 / 10000（＝ × 3 / 1000） ====

-- 境界
example : motouriLightOilReduction 0 = 0 := by decide
example : motouriLightOilReduction 1 = 0 := by decide
example : motouriLightOilReduction 99 = 0 := by decide
example : motouriLightOilReduction 100 = 0 := by decide
-- 端数切り捨て（切り上がり境界 334、10 倍過大バガード 1000 → 3）
example : motouriLightOilReduction 333 = 0 := by decide
example : motouriLightOilReduction 334 = 1 := by decide
example : motouriLightOilReduction 999 = 2 := by decide
example : motouriLightOilReduction 1000 = 3 := by decide
example : motouriLightOilReduction 3333 = 9 := by decide
example : motouriLightOilReduction 3334 = 10 := by decide
example : motouriLightOilReduction 10000 = 30 := by decide

-- ==== 区分選択（Bool は率選択にのみ使用） ====

example : reductionRate true = tokuteiReductionRate := rfl
example : reductionRate false = motouriReductionRate := rfl
example : lightOilReductionForDealer true 100 = 1 := by decide
example : lightOilReductionForDealer false 100 = 0 := by decide
example : lightOilReductionForDealer true 1000 = 10 := by decide
example : lightOilReductionForDealer false 1000 = 3 := by decide
example : lightOilReductionForDealer false 1000 < lightOilReductionForDealer true 1000 := by decide

-- ==== 率パラメータの positivity（定数値の再確認） ====

example : tokuteiReductionRate.num = 1 := by decide
example : tokuteiReductionRate.den = 100 := by decide
example : motouriReductionRate.num = 30 := by decide
example : motouriReductionRate.den = 10000 := by decide

end JapanTaxLaw.LocalTaxLightOilQuantity
