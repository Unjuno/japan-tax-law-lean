import JapanTaxLaw.SpecialMeasuresApportionment

/-!
# SpecialMeasuresApportionmentTests — 租税特別措置法施行令 第二十五条の十八 / 第四十条の五の二 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

按分共通・art. 25の18・art. 40の5の2 の算定式と境界（分母零、按分 1:1、
端数切り捨て）を確認する。

NOT MODELLED: 財産価額・政令額・課税価格の認定、特定贈与者の該当性、その他の政令要件
（すべて caller-established、impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.SpecialMeasuresApportionment

open JapanTaxLaw.TaxFinance

-- ==== apportion ====
-- 分母零 → 0（安全版）
example : apportion 10 3 0 = 0 := by decide
example : apportion 0 0 0 = 0 := by decide
-- 按分 1:1
example : apportion 100 100 100 = 100 := by decide
example : apportion 1_100_000 1_100_000 1_100_000 = 1_100_000 := by decide
-- 端数切り捨て
example : apportion 10 7 3 = 23 := by decide
example : apportion 1_100_000 1 3 = 366_666 := by decide
example : apportion 1_100_000 2 3 = 733_333 := by decide
-- 分子零
example : apportion 100 0 100 = 0 := by decide

-- ==== art. 25の18 ====
-- 割合ペア
example : nonTaxablePortionRatio 10_000_000 2_000_000 = (2_000_000, 10_000_000) := by decide
-- 財産価額 > 0 なら結果は政令額そのもの
example : nonTaxablePortion 10_000_000 2_000_000 = 2_000_000 := by decide
example : nonTaxablePortion 100 7 = 7 := by decide
-- 財産価額 = 0 → 0
example : nonTaxablePortion 0 7 = 0 := by decide

-- ==== art. 40の5の2 ====
example : specifiedGiftBasicDeduction = 1_100_000 := by decide
example : perDonorRatio 4_000_000 10_000_000 = (4_000_000, 10_000_000) := by decide
-- 按分: 1_100_000 × (各課税価格 / 合計)
example : perDonorDeduction 4_000_000 10_000_000 = 440_000 := by decide
example : perDonorDeduction 3_000_000 10_000_000 = 330_000 := by decide
example : perDonorDeduction 2_500_000 10_000_000 = 275_000 := by decide
-- 按分 1:1 → 百十万円
example : perDonorDeduction 10_000_000 10_000_000 = 1_100_000 := by decide
-- 合計額 0 → 0
example : perDonorDeduction 5 0 = 0 := by decide
-- 端数切り捨て
example : perDonorDeduction 1 3 = 366_666 := by decide

end JapanTaxLaw.SpecialMeasuresApportionment
