import JapanTaxLaw.LocalTaxOrderRate99A

/-!
# LocalTaxOrderRate99ATests — 地方税法施行令 第九条の十四・第九条の十八 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

原文はいずれも「政令で定める率は、百分の九十九とする」。本テストはその数値
（99/100、den = 100、小数点なし）と税額 = 課税標準 × 99/100（切り捨て）を確認する。

NOT MODELLED: 課税標準・法第七十一条の二十五第一項／第七十一条の四十七第一項の
適用該当性（すべて caller-established）。Bool は計算式に混入させていない。

-/

namespace JapanTaxLaw.LocalTaxOrderRate99A

open JapanTaxLaw.TaxFinance

-- 定数（原文「百分の九十九」= 99/100）
example : art14Rate.numDen = (99, 100) := by decide
example : art18Rate.numDen = (99, 100) := by decide
example : art14Rate.applyFloor 100 = 99 := by decide
example : art18Rate.applyFloor 100 = 99 := by decide

-- 税額 = 課税標準 × 99/100（境界: 0 / 1 / 100 / 101 と端数）
example : art14Tax 0 = 0 := by decide
example : art14Tax 1 = 0 := by decide
example : art14Tax 100 = 99 := by decide
example : art14Tax 101 = 99 := by decide
example : art14Tax 50 = 49 := by decide       -- 49.5 → 49（端数切り捨て）
example : art14Tax 3 = 2 := by decide         -- 2.97 → 2
example : art14Tax 1000 = 990 := by decide

-- 第九条の十八も同一
example : art18Tax 0 = 0 := by decide
example : art18Tax 1 = 0 := by decide
example : art18Tax 100 = 99 := by decide
example : art18Tax 101 = 99 := by decide
example : art18Tax 1000 = 990 := by decide

-- 両条の結果は一致
example : art14Tax 12_345 = art18Tax 12_345 := by decide
example : art14Tax 1 = art18Tax 1 := by decide

end JapanTaxLaw.LocalTaxOrderRate99A
