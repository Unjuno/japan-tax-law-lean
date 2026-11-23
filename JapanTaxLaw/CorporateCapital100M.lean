import JapanTaxLaw.TaxFinance

/-!
# CorporateCapital100M — 法人税法 art. 66（資本金の額 一億円超）

Sources (pinned):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Raw snapshot: data/raw/340AC0000000034_20261001_508AC0000000012.law.json

Pinned 原文: 「当該各事業年度終了の時における資本金の額又は出資金の額が一億円を超える法人」

Scoped claim: only the 資本金の額 一億円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CorporateCapital100M

def capitalFloor100M : Nat := 100000000

def exceedsCapital100M (x : Nat) : Bool :=
  decide (capitalFloor100M < x)

theorem threshold_value : capitalFloor100M = 100000000 := rfl

end JapanTaxLaw.CorporateCapital100M
