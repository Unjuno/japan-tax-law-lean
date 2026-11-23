import JapanTaxLaw.TaxFinance

/-!
# ConstructionCost1M — 地方税法施行令 art. 9（工事費用の合計額 百万円超）

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

Pinned 原文: 「前号イからヘまでに掲げる工事に要した費用の額の合計額が百万円を超えること。」

Scoped claim: only the 工事費用の合計額 百万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ConstructionCost1M

def constructionFloor1M : Nat := 1000000

def exceedsConstruction1M (x : Nat) : Bool :=
  decide (constructionFloor1M < x)

theorem threshold_value : constructionFloor1M = 1000000 := rfl

end JapanTaxLaw.ConstructionCost1M
