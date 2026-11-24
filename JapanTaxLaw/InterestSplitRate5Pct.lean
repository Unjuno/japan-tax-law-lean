import JapanTaxLaw.TaxFinance

/-
# InterestSplitRate5Pct — 地方税法 第七十一条の六 第一款（利子割の税率）

Pinned sources:
  Law id: 325AC0000000226 (地方税法)
  Revision: 325AC0000000226_20261101_508AC0000000002 (enforced 2026-11-01)
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 71_6, Paragraph Num 1, Sentence 1 (exact source_path below).
  SHA-256 (raw bytes): 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53

Verbatim 原文 needle, scoped to Article 71_6 / Paragraph 1:
  「利子割の税率は、百分の五とする。」

Variable contract:
  rateNumerator   = 五（百分の五の分子、5）
  rateDenominator = 百（百分の五の分母、100）
  hundredFoldAmount base = base × 5 — the exact numerator of the levy;
  the exact levy is base × 5 / 100, kept EXACT here (no truncation).

Scope: ONLY the flat 5-per-100 rate of Paragraph 1 is modelled. Paragraph 2
(the 租税特別措置法 art. 4-2(9) / 4-3(10) cross-reference), Paragraph 3
(政令 delegation), the tax base, the levy procedure and all rounding rules are
NOT MODELLED. This clause prescribes no 端数処理; no floor/ceiling is imported.
-/

namespace JapanTaxLaw.InterestSplitRate5Pct

/-- 百分の五の分子。 -/
def rateNumerator : Nat := 5

/-- 百分の五の分母。 -/
def rateDenominator : Nat := 100

/-- 課税標準 base に対する正確な税額の百倍（base × 5）。端数処理を含まない。 -/
def hundredFoldAmount (base : Nat) : Nat :=
  base * rateNumerator

/-- 原文の「五」= 5。 -/
theorem numerator_is_five : rateNumerator = 5 := rfl

/-- 原文の「百」= 100。 -/
theorem denominator_is_hundred : rateDenominator = 100 := rfl

/-- 百分の五 = 五/百 = 一/二十（端数を導入せずexact）。 -/
theorem rate_equals_one_twentieth : rateNumerator * 20 = rateDenominator := by decide

/-- base = 0 なら税額 0。 -/
theorem zero_base : hundredFoldAmount 0 = 0 := by decide

/-- base = 100 なら税額 5（百倍 500）。 -/
theorem hundred_base : hundredFoldAmount 100 = 500 := by decide

/-- base = 200 なら税額 10（百倍 1000）。 -/
theorem two_hundred_base : hundredFoldAmount 200 = 1000 := by decide

end JapanTaxLaw.InterestSplitRate5Pct
