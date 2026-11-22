import JapanTaxLaw.TaxFinance

/-!
# FineCap200k — 地方税法 802（過料 二十万円以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「次の各号のいずれかに該当するときは、その違反行為をした機構の役員は、二十万円以下の過料に処する。」

Scoped claim: only the 過料 二十万円以下; other conditions are caller-established.
-/

namespace JapanTaxLaw.FineCap200k

def fineCapYen : Nat := 200000

def withinFine (x : Nat) : Bool :=
  decide (x <= fineCapYen)

theorem threshold_value : fineCapYen = 200000 := rfl

end JapanTaxLaw.FineCap200k
