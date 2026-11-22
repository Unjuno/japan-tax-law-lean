import JapanTaxLaw.TaxFinance

/-!
# TaxErasureExtension30 — 地方税法 art. 22の6（消去請求期間の延長 三十日以内）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「特に必要があるときは、三十日を超えない範囲内で延長」

Scoped claim: only the 消去請求期間の延長 三十日以内; other conditions are caller-established.
-/

namespace JapanTaxLaw.TaxErasureExtension30

def extensionCapDays : Nat := 30

def withinExtension (x : Nat) : Bool :=
  decide (x <= extensionCapDays)

theorem threshold_value : extensionCapDays = 30 := rfl

end JapanTaxLaw.TaxErasureExtension30
