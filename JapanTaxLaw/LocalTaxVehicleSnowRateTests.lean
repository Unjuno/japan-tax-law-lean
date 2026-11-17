import JapanTaxLaw.LocalTaxVehicleSnowRate

/-!
# LocalTaxVehicleSnowRateTests — 地方税法施行令 第四十四条の三 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

原文は「十分の十から…月数（当該月数が四を超える場合には、四）に十分の〇・七五を
乗じて得た数を控除したものとする」。本テストはその数値（〇・七五 = 75/1000 = 3/40、
月数キャップ 4）を確認する。指示文の「十分の一」ではない点に注意（impl doc-comment 参照）。

NOT MODELLED: 積雪月数・基準税額・該当性（caller-established）、第2項の月数算定
（暦に従い一月未満切捨て）。Bool は計算式に混入させていない。

-/

namespace JapanTaxLaw.LocalTaxVehicleSnowRate

open JapanTaxLaw.TaxFinance

-- 定数（原文どおり 〇・七五 = 3/40、十分の十 = 10/10）
example : fullRate.numDen = (10, 10) := by decide
example : monthlyReductionRate.numDen = (3, 40) := by decide
example : fullRate.applyFloor 1000 = 1000 := by decide
example : monthlyReductionRate.applyFloor 1000 = 75 := by decide

-- 月数キャップ（0/1/4/5(キャップ)/境界）
example : capSnowMonths 0 = 0 := by decide
example : capSnowMonths 1 = 1 := by decide
example : capSnowMonths 4 = 4 := by decide
example : capSnowMonths 5 = 4 := by decide
example : capSnowMonths 11 = 4 := by decide

-- 軽減割合（den = 40、分子 = 40 − 3·min(s,4)）
example : (snowReductionRatio 0).numDen = (40, 40) := by decide
example : (snowReductionRatio 1).numDen = (37, 40) := by decide
example : (snowReductionRatio 4).numDen = (28, 40) := by decide
example : (snowReductionRatio 5).numDen = (28, 40) := by decide
example : (snowReductionRatio 5).num = (snowReductionRatio 4).num := by decide

-- 税額 = 基準税額 × 割合（切り捨て）
example : snowReducedTax 1000 0 = 1000 := by decide
example : snowReducedTax 1000 1 = 925 := by decide
example : snowReducedTax 1000 4 = 700 := by decide
example : snowReducedTax 1000 5 = 700 := by decide
example : snowReducedTax 2000 4 = 1400 := by decide
example : snowReducedTax 0 4 = 0 := by decide

-- 境界（端数切り捨て・キャップによる単調性）
example : snowReducedTax 999 1 = 924 := by decide
example : snowReducedTax 999 5 = 699 := by decide  -- 999×28/40 = 699.3 → 699
example : snowReducedTax 1 4 = 0 := by decide

end JapanTaxLaw.LocalTaxVehicleSnowRate
