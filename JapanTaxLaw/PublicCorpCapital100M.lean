import JapanTaxLaw.TaxFinance

/-!
# PublicCorpCapital100M — 法人税法施行規則 art. 36_4（資本金の額 一億円超（公益法人等を除く））

Sources (pinned):

  Law id: 340M50000040012
  Revision: 340M50000040012_20261001_505M60000040013
  Raw snapshot: data/raw/340M50000040012_20261001_505M60000040013.law.json

Pinned 原文: 「その設立の時における資本金の額又は出資金の額が一億円を超える法人（公益法人等を除く。）」

Scoped claim: only the 資本金の額 一億円超（公益法人等を除く） threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.PublicCorpCapital100M

def publicCapitalFloor100M : Nat := 100000000

def exceedsPublicCapital100M (x : Nat) : Bool :=
  decide (publicCapitalFloor100M < x)

theorem threshold_value : publicCapitalFloor100M = 100000000 := rfl

end JapanTaxLaw.PublicCorpCapital100M
