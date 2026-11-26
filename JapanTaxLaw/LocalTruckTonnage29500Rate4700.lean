import JapanTaxLaw.TaxFinance

/-!
# LocalTruckTonnage29500Rate4700 — 地方税法 art. 154（二万九千五百円＋八トン超一トンごとに四千七百円）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「二万九千五百円に最大積載量が八トンを超える部分一トンまでごとに四千七百円を加算した額」

Scoped claim: only the 二万九千五百円＋八トン超一トンごとに四千七百円 numeric classification; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalTruckTonnage29500Rate4700

def baseAmount : Nat := 29500
def perUnit : Nat := 4700
def threshold : Nat := 8

def amount (tons : Nat) : Nat :=
  baseAmount + perUnit * (tons - threshold)

theorem constants : baseAmount = 29500 ∧ perUnit = 4700 ∧ threshold = 8 := by
  constructor
  · rfl
  constructor
  · rfl
  · rfl

end JapanTaxLaw.LocalTruckTonnage29500Rate4700
