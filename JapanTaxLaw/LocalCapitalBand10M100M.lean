import JapanTaxLaw.TaxFinance

/-!
# LocalCapitalBand10M100M — 地方税法 art. 52（資本金等の額 千万円超一億円以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「二　資本金等の額を有する法人で資本金等の額が千万円を超え一億円以下であるもの」

Scoped claim: only the 資本金等の額 千万円超一億円以下 interval; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCapitalBand10M100M

def lowerBound : Nat := 10000000
def upperBound : Nat := 100000000

def inBand (x : Nat) : Bool :=
  decide (lowerBound < x ∧ x <= upperBound)

theorem bounds_value : lowerBound = 10000000 ∧ upperBound = 100000000 := by
  constructor <;> rfl

end JapanTaxLaw.LocalCapitalBand10M100M
