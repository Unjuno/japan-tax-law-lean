import JapanTaxLaw.TaxFinance

/-!
# LocalCapitalBand1B5B — 地方税法 art. 52（資本金等の額 十億円超五十億円以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「四　資本金等の額を有する法人で資本金等の額が十億円を超え五十億円以下であるもの」

Scoped claim: only the 資本金等の額 十億円超五十億円以下 interval; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCapitalBand1B5B

def lowerBound : Nat := 1000000000
def upperBound : Nat := 5000000000

def inBand (x : Nat) : Bool :=
  decide (lowerBound < x ∧ x <= upperBound)

theorem bounds_value : lowerBound = 1000000000 ∧ upperBound = 5000000000 := by
  constructor <;> rfl

end JapanTaxLaw.LocalCapitalBand1B5B
