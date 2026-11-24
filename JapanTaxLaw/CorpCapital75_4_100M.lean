import JapanTaxLaw.TaxFinance

/-!
# CorpCapital75_4_100M — 法人税法 art. 75_4（資本金の額 一億円超）

Sources (pinned):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Raw snapshot: data/raw/340AC0000000034_20261001_508AC0000000012.law.json

Pinned 原文: 「当該事業年度開始の時における資本金の額又は出資金の額が一億円を超える法人」

Scoped claim: only the 資本金の額 一億円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CorpCapital75_4_100M

def capitalFloor75_4 : Nat := 100000000

def exceedsCapital75_4 (x : Nat) : Bool :=
  decide (capitalFloor75_4 < x)

theorem threshold_value : capitalFloor75_4 = 100000000 := rfl

end JapanTaxLaw.CorpCapital75_4_100M
