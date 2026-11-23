import JapanTaxLaw.TaxFinance

/-
# InvestmentIncomeBelowHalf — 投資関連所得の収入金額割合 百分の五十未満（第六条の九）

Sources (pinned):
  Law id: 362CO0000000335
  Revision: 362CO0000000335_20260521_506CO0000000150
  Raw snapshot: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
  SHA-256: 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
  Article Num 6_9 (第六条の九), scoped article.

原文逐語 — needle verbatim in scoped Article 6の9:
  「直前事業年度の総収入金額のうちに当該直前事業年度の投資関連所得（利子所得、配当所得その他の総務省令、財務省令で定める所得をいう。ロにおいて同じ。）に係る収入金額の占める割合が百分の五十に満たないこと。」

Variable contract:
  p = 投資関連所得の収入金額の総収入金額に占める割合 (Nat, %, 0..100).
  百分の五十 = 50 per hundred = 50/100; percentScale = 100 documents the 百分 denominator.
  百分の五十に満たない = p < 50 STRICTLY (満たない, NOT 以下): p = 50 does NOT qualify.
  Only the explicit numeric ratio condition is modelled.

Scope / NOT MODELLED:
  投資関連所得・利子所得・配当所得の定義、総務省令・財務省令への委任、直前事業年度の算定、
  他の号の要件（資本金・設立年月日等）、具体的な適用場面。
  本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.InvestmentIncomeBelowHalf

/-- 五十 = 50（百分の五十の分子）. -/
def thresholdPercent : Nat := 50

/-- 百分 = 100（per-hundred scale, 割合の分母）. -/
def percentScale : Nat := 100

/-- 投資関連所得の割合 p（%）が百分の五十に満たないか。p = 50 は対象外（厳密未満）。 -/
def belowHalf (p : Nat) : Bool := decide (p < thresholdPercent)

theorem thresholdPercent_eq_50 : thresholdPercent = 50 := rfl
theorem percentScale_eq_100 : percentScale = 100 := rfl
theorem belowHalf_0 : belowHalf 0 = true := by decide
theorem belowHalf_49 : belowHalf 49 = true := by decide
theorem belowHalf_50 : belowHalf 50 = false := by decide
theorem belowHalf_51 : belowHalf 51 = false := by decide
theorem belowHalf_100 : belowHalf 100 = false := by decide

end JapanTaxLaw.InvestmentIncomeBelowHalf
