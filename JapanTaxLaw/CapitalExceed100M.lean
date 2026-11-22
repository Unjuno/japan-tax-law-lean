import JapanTaxLaw.TaxFinance

/-!
# CapitalExceed100M — 地方税法 art. 72_32（資本金の額が一億円を超える法人）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「納税申告書に係る事業年度開始の日現在における資本金の額又は出資金の額が一億円を超える法人」

Scoped claim: only the 資本金の額が一億円を超える法人 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CapitalExceed100M

def capitalThreshold100M : Nat := 100000000

def exceedsCapital100M (x : Nat) : Bool :=
  decide (capitalThreshold100M < x)

theorem threshold_value : capitalThreshold100M = 100000000 := rfl

end JapanTaxLaw.CapitalExceed100M
