import JapanTaxLaw.TaxFinance

/-!
# LocalCapitalBand100M1B — 地方税法 art. 52（資本金等の額 一億円超十億円以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「三　資本金等の額を有する法人で資本金等の額が一億円を超え十億円以下であるもの」

Scoped claim: only the 資本金等の額 一億円超十億円以下 interval; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCapitalBand100M1B

def lowerBound : Nat := 100000000
def upperBound : Nat := 1000000000

def inBand (x : Nat) : Bool :=
  decide (lowerBound < x ∧ x <= upperBound)

theorem bounds_value : lowerBound = 100000000 ∧ upperBound = 1000000000 := by
  constructor <;> rfl

end JapanTaxLaw.LocalCapitalBand100M1B
