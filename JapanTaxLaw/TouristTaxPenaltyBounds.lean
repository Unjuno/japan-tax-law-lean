import JapanTaxLaw.TaxFinance

/-!
# TouristTaxPenaltyBounds — 国際観光旅客税法 art.25(1) 罰則上限（bounded slice）

Sources (pinned):
  Law id: 430AC0000000016
  Revision: 430AC0000000016_20260701_508AC0000000012
  Raw snapshot: data/raw/430AC0000000016_20260701_508AC0000000012.law.json
  Normative id: NORM|2d2913868325c56a8cefe1373ea380c83f23b4e4ae0b951415c0facb5b02c43e
  Article Num 25, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「次の各号のいずれかに該当する者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Computation（入力: 拘禁年数・罰金額。二者のいずれかの上限を満たせば成立）:
  withinPenalty(prisonYears, fineYen) =
    prisonYears <= 1 || fineYen <= 500000

Scope / NOT MODELLED:
  - 各号に規定する行為の認定、量刑の選択・併科、手続は NOT MODELLED。
  - 本モデルは原文に明示された二つの上限の判定スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.TouristTaxPenaltyBounds

/-- 一年以下の拘禁刑又は五十万円以下の罰金の上限内か。 -/
def withinPenalty (prisonYears : Nat) (fineYen : Nat) : Bool :=
  prisonYears <= 1 || fineYen <= 500000

example : withinPenalty 0 0 = true := by decide
example : withinPenalty 2 500000 = true := by decide
example : withinPenalty 2 500001 = false := by decide
example : withinPenalty 1 999999 = true := by decide

end JapanTaxLaw.TouristTaxPenaltyBounds
