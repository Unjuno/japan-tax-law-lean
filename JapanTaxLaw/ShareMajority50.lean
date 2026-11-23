import JapanTaxLaw.TaxFinance

/-
# ShareMajority50 — 持分の割合 百分の五十超（租税特別措置法施行令 第十六条の十二）

Sources (pinned):
  Law id: 344M50000048001 (租税特別措置法施行令)
  Revision: 344M50000048001_20260601_508M60000048004
  Raw snapshot: data/raw/344M50000048001_20260601_508M60000048004.law.json
  SHA-256: 16f478fac8e3f64e3bda43d638c4fc98bfd8f5747af82b4e2321ac0648a8b0fe
  Article Num 16_12 (第十六条の十二), scoped article.

原文逐語 — needle verbatim in scoped Article 16の12:
  「当該他の準組合の準組合財産に対する持分の割合が百分の五十を超える場合における当該持分」

Variable contract:
  p = 持分の割合 as a Nat percent value in range 0..100.
  百分の五十 = 50 per hundred = 50/100; percentScale = 100 documents the 百分 denominator.
  百分の五十を超える = p > 50 STRICTLY (超える, NOT 以上): p = 50 does NOT qualify.
  Only the explicit numeric ownership threshold is modelled.

Scope / NOT MODELLED:
  準組合・準組合財産・持分の定義、他の号の閾値、1/3 議決基準、具体的算定・適用場面。
  本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ShareMajority50

/-- 五十 = 50（百分の五十の分子）. -/
def majorityPercent : Nat := 50

/-- 百分 = 100（per-hundred scale, 割合の分母）. -/
def percentScale : Nat := 100

/-- 持分の割合 p（%）が百分の五十を厳密に超えるか。p = 50 は対象外。 -/
def exceedsMajority (p : Nat) : Bool := decide (majorityPercent < p)

theorem majorityPercent_eq_50 : majorityPercent = 50 := rfl
theorem percentScale_eq_100 : percentScale = 100 := rfl
theorem exceedsMajority_0 : exceedsMajority 0 = false := by decide
theorem exceedsMajority_49 : exceedsMajority 49 = false := by decide
theorem exceedsMajority_50 : exceedsMajority 50 = false := by decide
theorem exceedsMajority_51 : exceedsMajority 51 = true := by decide
theorem exceedsMajority_100 : exceedsMajority 100 = true := by decide

end JapanTaxLaw.ShareMajority50
