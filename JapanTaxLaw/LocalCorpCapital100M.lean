import JapanTaxLaw.TaxFinance

/-!
# LocalCorpCapital100M — 地方法人税法 art. 19_3（資本金等の額 一億円超）

Sources (pinned):

  Law id: 426AC0000000011
  Revision: 426AC0000000011_20260401_507AC0000000013
  Raw snapshot: data/raw/426AC0000000011_20260401_507AC0000000013.law.json

Pinned 原文: 「当該課税事業年度開始の時における資本金の額、出資金の額その他これらに類するものとして政令で定める金額が一億円を超える法人」

Scoped claim: only the 資本金等の額 一億円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCorpCapital100M

def localCapitalFloor100M : Nat := 100000000

def exceedsLocalCapital100M (x : Nat) : Bool :=
  decide (localCapitalFloor100M < x)

theorem threshold_value : localCapitalFloor100M = 100000000 := rfl

end JapanTaxLaw.LocalCorpCapital100M
