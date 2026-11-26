import JapanTaxLaw.TaxFinance

/-!
# LocalCorpCapital10M100MEmployees50 — 地方税法 art. 312（資本金千万円超一億円以下 かつ 従業者五十人以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「三　資本金等の額を有する法人で資本金等の額が千万円を超え一億円以下であるもののうち、従業者数の合計数が五十人以下であるもの」

Scoped claim: only the 資本金千万円超一億円以下 かつ 従業者五十人以下 numeric classification; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCorpCapital10M100MEmployees50

def capitalLower : Nat := 10000000
def capitalUpper : Nat := 100000000
def employeeCeiling : Nat := 50

def qualified (capital employees : Nat) : Bool :=
  decide (capitalLower < capital ∧ capital <= capitalUpper ∧ employees <= employeeCeiling)

theorem constants : capitalLower = 10000000 ∧ capitalUpper = 100000000 ∧ employeeCeiling = 50 := by
  constructor
  · rfl
  constructor
  · rfl
  · rfl

end JapanTaxLaw.LocalCorpCapital10M100MEmployees50
