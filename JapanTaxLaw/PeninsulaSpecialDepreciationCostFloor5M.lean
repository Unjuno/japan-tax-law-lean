import Std
import JapanTaxLaw.TaxFinance

/-
# PeninsulaSpecialDepreciationCostFloor5M — 半島振興法第十七条の地方税不均一課税措置省令 第一条 第一項 第一号 ロ
（特別償却設備の取得価額が五百万円以上のもの）

Pinned sources:
  Law id: 407M50000008016 (半島振興法第十七条の地方税の不均一課税に伴う措置が
    適用される場合等を定める省令)
  Revision: 407M50000008016_20250401_507M60000008028
  Raw snapshot: data/raw/407M50000008016_20250401_507M60000008028.law.json
  Article Num 1, Paragraph 1, Item 1, Subitem ロ (Subitem1#2), Column 2, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#1/Item#1/Subitem1#2/Subitem1Sentence/Column#2/Sentence#1
  Normative unit: NORM|3fa6d1bdab96125d25c72ee41d13ac0b0ed4d876f9d77c4f3f685e51b1e9bdd6

Verbatim 原文 needle (scoped to Article 1, this leaf only):
  「五百万円以上のもの」

Variable contract:
  cost = 特別償却設備の取得価額の合計額 (caller-established, Nat 円)
  floorYen = 五百万円 = 5,000,000 円
  eligible cost = (floorYen <= cost) — 「以上」 is INCLUSIVE.

This is a single monotonic eligibility comparison, not a rate or rounding rule.
It gates the 不均一課税 treatment for 事業税 under branch ロ.

Scope: ONLY this ≥ comparison for branch ロ. Branch イ (千万円超五千万円以下 →
千万円, 五千万円超 → 二千万円) and its 租税特別措置法 cross-references, the
計画期間 / 令和九年三月三十一日 window, items 二・三 (不動産取得税・固定資産税)
and their 一年以内 rule, whether the prefecture actually imposes 不均一課税,
and the 附則 enforcement dates are NOT MODELLED. No legal review asserted.
-/

namespace JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M

/-- 原文の「五百万円」= 5,000,000 円（下限、以上は inclusive）。 -/
def floorYen : Nat := 5_000_000

/-- 取得価額が五百万円以上か（単調な eligibility 判定）。 -/
def eligible (cost : Nat) : Bool :=
  floorYen <= cost

theorem floor_is_five_million : floorYen = 5_000_000 := rfl

/-- 厳密境界: 下限未満 / 下限丁度 / 下限超。 -/
theorem below_floor : eligible 4_999_999 = false := by decide
theorem at_floor : eligible 5_000_000 = true := by decide
theorem above_floor : eligible 5_000_001 = true := by decide

/-- 零・小さい入力は対象外。 -/
theorem zero_cost : eligible 0 = false := by decide
theorem small_cost : eligible 1 = false := by decide

end JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M
