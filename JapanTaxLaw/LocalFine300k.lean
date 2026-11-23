import JapanTaxLaw.TaxFinance

/-!
# LocalFine300k — 地方税法 art. 801（罰金 三十万円以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「次の各号のいずれかに該当するときは、その違反行為をした機構の役員又は職員は、三十万円以下の罰金に処する。」

Scoped claim: only the 罰金 三十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalFine300k

def localFineCap300k : Nat := 300000

def withinLocalFine (x : Nat) : Bool :=
  decide (x <= localFineCap300k)

theorem threshold_value : localFineCap300k = 300000 := rfl

end JapanTaxLaw.LocalFine300k
