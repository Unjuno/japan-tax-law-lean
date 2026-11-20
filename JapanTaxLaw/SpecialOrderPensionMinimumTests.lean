import JapanTaxLaw.SpecialOrderPensionMinimum

/-!
# SpecialOrderPensionMinimum tests — 租税特別措置法施行令 第二十六条の二十七 smoke checks

Decidable smoke tests for the ¥1,180,000 / ¥1,680,000 / ¥900,000 constants,
pinned to

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Every `example` is kernel-decided. The four Bool combinations cover the
65歳未満基底 / 65歳以上特例 / 65歳以上調整対象年金 branches.
年齢区分・年金種別・基準日は caller-established、Bool は金額算術に入れない。
-/

namespace JapanTaxLaw.SpecialOrderPensionMinimum

open JapanTaxLaw.TaxFinance

-- 金額リテラル
example : baseMinimumDeduction = 1_180_000 := by decide
example : specialMinimumDeduction = 1_680_000 := by decide
example : adjustedPensionMinimumDeduction = 900_000 := by decide

-- 正性
example : 0 < baseMinimumDeduction := by decide
example : 0 < specialMinimumDeduction := by decide
example : 0 < adjustedPensionMinimumDeduction := by decide

-- 原文の数的関係: 九十万円 < 百十八万円 < 百六十八万円
example : adjustedPensionMinimumDeduction < baseMinimumDeduction := by decide
example : adjustedPensionMinimumDeduction < specialMinimumDeduction := by decide
example : baseMinimumDeduction < specialMinimumDeduction := by decide

-- 年齢65歳未満: 年金種別にかかわらず基底「百十八万円」
example : minimumDeduction false false = 1_180_000 := by decide
example : minimumDeduction false true = 1_180_000 := by decide
example : minimumDeduction false false = minimumDeduction false true := by decide

-- 年齢65歳以上: 調整対象以外「百六十八万円」/ 調整対象「九十万円」
example : minimumDeduction true false = 1_680_000 := by decide
example : minimumDeduction true true = 900_000 := by decide
example : minimumDeduction true true < minimumDeduction true false := by decide

-- 4 通りの選択値はいずれも 90 万〜168 万円の範囲
example : minimumDeduction false false = 1_180_000 := by decide
example : minimumDeduction true false = 1_680_000 := by decide
example : minimumDeduction true true = 900_000 := by decide

-- ==== 追加の必須境界 (a) 零入力 / (b) 小さい正の入力 (1..13) / (c) saturation ====
-- 本モジュールは 2 つの Bool で 3 つの Money 定数を選ぶだけ（金額算術は持たない）。
-- 最低控除額は控除の下限（floor）なので、控除後課税額 = max(0, 年金 − 最低控除額) は
-- saturating Nat 減算になる。法定の最低控除額 168 万円を閾値にした境界を確認する。
-- (a) 零入力: 年金 0 円 → 0 - 168万 = 0（saturating）
example : 0 - specialMinimumDeduction = 0 := by decide
-- (b) 小さい正の入力 (1..13): 年金 13 円も最低控除 168 万円に吸収され 0
example : 13 - specialMinimumDeduction = 0 := by decide
-- (c) 閾値境界の saturation: 最低控除額 168 万円を 1 円超える年金でも控除後は 0
--     （CustomsSmallConsignment の threshold - (threshold+1) = 0 と同型）
example : specialMinimumDeduction - 1_680_001 = 0 := by decide

end JapanTaxLaw.SpecialOrderPensionMinimum
