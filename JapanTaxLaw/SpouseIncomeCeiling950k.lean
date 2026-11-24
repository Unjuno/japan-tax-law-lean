import JapanTaxLaw.TaxFinance

/-!
# SpouseIncomeCeiling950k — 所得税法施行令 art. 83の2(1)(1) 配偶者の合計所得金額要件（bounded slice）

Sources (pinned):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  Normative id: NORM|a83c043a9a854501ffc07d437ab7af860fa3490cdfee81771913e2cfa6a3a407
  Article Num 83_2, paragraph 1, item 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「合計所得金額が九十五万円以下である配偶者」

Computation（単位: 円。九十五万円 = 950000）:
  qualified(totalIncome) = totalIncome <= 950000

Scope / NOT MODELLED:
  - 配偶者控除の金額・他の要件（居住者、生計一、年末調整等）は NOT MODELLED。
  - 他の号・条・所得区分は NOT MODELLED。
  - 本モデルは有限の整数.input 上の判定スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpouseIncomeCeiling950k

/-- 合計所得金額が九十五万円以下である配偶者か（円単位）。 -/
def qualifiedSpouse (totalIncome : Nat) : Bool :=
  totalIncome <= 950000

example : qualifiedSpouse 0 = true := by decide
example : qualifiedSpouse 949999 = true := by decide
example : qualifiedSpouse 950000 = true := by decide
example : qualifiedSpouse 950001 = false := by decide
example : qualifiedSpouse 2000000 = false := by decide

end JapanTaxLaw.SpouseIncomeCeiling950k
