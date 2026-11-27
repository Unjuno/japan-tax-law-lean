import JapanTaxLaw.TaxFinance

/-!
# LocalRoadTaxPenaltyBounds — 地方道路税法 art.15(1) 罰則上限（bounded slice）

Sources (pinned):
  Law id: 330AC0000000104
  Revision: 330AC0000000104_20260401_508AC0000000012
  Raw snapshot: data/raw/330AC0000000104_20260401_508AC0000000012.law.json
  Normative id: NORM|59252c611830c7174f1e31b83aa97cdd93dbf05739d25bfc56d6cd9d72618588
  Article Num 15, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「次の各号のいずれかに該当する者は、十年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」

Computation（入力: 拘禁年数・罰金額。二者のいずれかの上限を満たせば成立）:
  withinPenalty(prisonYears, fineYen) =
    prisonYears <= 10 || fineYen <= 1000000

Scope / NOT MODELLED:
  - 各号に規定する行為の認定、量刑の選択・併科、手続は NOT MODELLED。
  - 本モデルは原文に明示された二つの上限の判定スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalRoadTaxPenaltyBounds

/-- 十年以下の拘禁刑又は百万円以下の罰金の上限内か。 -/
def withinPenalty (prisonYears : Nat) (fineYen : Nat) : Bool :=
  prisonYears <= 10 || fineYen <= 1000000

example : withinPenalty 0 0 = true := by decide
example : withinPenalty 11 1000000 = true := by decide
example : withinPenalty 11 1000001 = false := by decide
example : withinPenalty 10 9999999 = true := by decide

end JapanTaxLaw.LocalRoadTaxPenaltyBounds
