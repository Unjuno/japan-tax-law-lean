import JapanTaxLaw.LocalTaxOrderRate77

/-!
# LocalTaxOrderRate77Tests — 地方税法施行令 第九条の二十二・第三十五条の四の五 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

pinned 原文（needle, 一字も変更せず）:

  「（法第七十一条の六十七第一項の率）第九条の二十二法第七十一条の六十七第一項の政令で定める率は、百分の九十九とする。」
  「（法第七十二条の七十六の率）第三十五条の四の五法第七十二条の七十六の政令で定める率は、百分の七・七とする。」

本テストは 99% = 99/100 と 7.7% = 77/1000 を確認する。
特に **base = 1000 → 77**（10 倍過大の 770 ではない）を明示的に検証する。

NOT MODELLED: 課税標準・該当性（caller-established）。Bool は計算式に混入させていない。

-/

namespace JapanTaxLaw.LocalTaxOrderRate77

open JapanTaxLaw.TaxFinance

-- 定数（原文どおり 99/100 と 77/1000）
example : art9_22Rate.numDen = (99, 100) := by decide
example : art35_4_5Rate.numDen = (77, 1000) := by decide
example : art9_22Rate.den = 100 := by decide
example : art35_4_5Rate.den = 1000 := by decide

-- ⚠ 10 倍過大バグ（770/1000）の防止: base = 1000 → 77
example : art35_4_5Rate.applyFloor 1000 = 77 := by decide
example : art35_4_5Tax 1000 = 77 := by decide
example : art35_4_5Tax 1000 ≠ 770 := by decide
example : art35_4_5Rate.numDen ≠ (770, 1000) := by decide

-- 第九条の二十二（99%）: 境界 0 / 1 / 1000、端数
example : art9_22Tax 0 = 0 := by decide
example : art9_22Tax 1 = 0 := by decide
example : art9_22Tax 100 = 99 := by decide
example : art9_22Tax 101 = 99 := by decide
example : art9_22Tax 1000 = 990 := by decide
example : art9_22Tax 999 = 989 := by decide
example : art9_22Tax 10_000 = 9_900 := by decide

-- 第三十五条の四の五（7.7% = 77/1000）: 境界 0 / 1 / 1000、端数
example : art35_4_5Tax 0 = 0 := by decide
example : art35_4_5Tax 1 = 0 := by decide
example : art35_4_5Tax 12 = 0 := by decide
example : art35_4_5Tax 13 = 1 := by decide
example : art35_4_5Tax 999 = 76 := by decide
example : art35_4_5Tax 1000 = 77 := by decide
example : art35_4_5Tax 2000 = 154 := by decide
example : art35_4_5Tax 10_000 = 770 := by decide

end JapanTaxLaw.LocalTaxOrderRate77
