import JapanTaxLaw.TaxFinance

/-!
# CustomsSmallConsignmentCap — 関税定率法 art. 14（課税価格の合計額 一万円以下）

Sources (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Pinned 原文: 「課税価格の合計額が一万円以下の物品」

Scoped claim: only the 課税価格の合計額 一万円以下; other conditions are caller-established.
-/

namespace JapanTaxLaw.CustomsSmallConsignmentCap

def smallConsignmentCapYen : Nat := 10000

def customsSmallCap (x : Nat) : Bool :=
  decide (x <= smallConsignmentCapYen)

theorem threshold_value : smallConsignmentCapYen = 10000 := rfl

end JapanTaxLaw.CustomsSmallConsignmentCap
