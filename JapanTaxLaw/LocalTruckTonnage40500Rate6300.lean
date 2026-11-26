import JapanTaxLaw.TaxFinance

/-!
# LocalTruckTonnage40500Rate6300 — 地方税法 art. 154（四万五百円＋八トン超一トンごとに六千三百円）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「四万五百円に最大積載量が八トンを超える部分一トンまでごとに六千三百円を加算した額」

Scoped claim: only the 四万五百円＋八トン超一トンごとに六千三百円 numeric classification; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalTruckTonnage40500Rate6300

def baseAmount : Nat := 40500
def perUnit : Nat := 6300
def threshold : Nat := 8

def amount (tons : Nat) : Nat :=
  baseAmount + perUnit * (tons - threshold)

theorem constants : baseAmount = 40500 ∧ perUnit = 6300 ∧ threshold = 8 := by
  constructor
  · rfl
  constructor
  · rfl
  · rfl

end JapanTaxLaw.LocalTruckTonnage40500Rate6300
