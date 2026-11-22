import JapanTaxLaw.TaxFinance

/-!
# CollectionPeriodCap30 — 国税徴収法 art. 115（買受代金の納付の期限の上限）

Sources (pinned):

  Law id: 334AC0000000147
  Revision: 334AC0000000147_20260525_506AC0000000052
  Raw snapshot: data/raw/334AC0000000147_20260525_506AC0000000052.law.json

Pinned 原文: 「ただし、その期間は、三十日を超えることができない。」

Scoped claim: only the 30-day upper bound on the payment period. The length
of the period itself and the other conditions of art. 115 are caller-established.
-/

namespace JapanTaxLaw.CollectionPeriodCap30

def maxPeriodDays : Nat := 30

def withinPeriod (days : Nat) : Bool :=
  decide (days <= maxPeriodDays)

theorem cap_value : maxPeriodDays = 30 := rfl

end JapanTaxLaw.CollectionPeriodCap30
