import JapanTaxLaw.TaxFinance

/-!
# StampFine300k — 印紙税法 art. 23（罰金 三十万円以下）

Sources (pinned):

  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Raw snapshot: data/raw/342AC0000000023_20261001_507AC0000000070.law.json

Pinned 原文: 「次の各号のいずれかに該当する者は、三十万円以下の罰金に処する。」

Scoped claim: only the 罰金 三十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.StampFine300k

def stampFineCap300k : Nat := 300000

def withinStampFine (x : Nat) : Bool :=
  decide (x <= stampFineCap300k)

theorem threshold_value : stampFineCap300k = 300000 := rfl

end JapanTaxLaw.StampFine300k
