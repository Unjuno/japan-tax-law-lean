import JapanTaxLaw.TaxFinance

/-!
# TaxErasureTotal60 — 地方税法 art. 22の6（消去請求期間の合計 六十日以内）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「ただし、消去しないよう求める期間は、通じて六十日を超えることができない。」

Scoped claim: only the 消去請求期間の合計 六十日以内; other conditions are caller-established.
-/

namespace JapanTaxLaw.TaxErasureTotal60

def totalCapDays : Nat := 60

def withinTotalErasure (x : Nat) : Bool :=
  decide (x <= totalCapDays)

theorem threshold_value : totalCapDays = 60 := rfl

end JapanTaxLaw.TaxErasureTotal60
