import JapanTaxLaw.TaxFinance

/-!
# LiquorFine500k — 酒税の保全及び酒類業組合等に関する法律 art. 98（罰金 五十万円以下）

Sources (pinned):

  Law id: 328AC0000000007
  Revision: 328AC0000000007_20250601_504AC0000000068
  Raw snapshot: data/raw/328AC0000000007_20250601_504AC0000000068.law.json

Pinned 原文: 「次の各号のいずれかに該当する者は、五十万円以下の罰金に処する。」

Scoped claim: only the 罰金 五十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LiquorFine500k

def liquorFineCap500k : Nat := 500000

def withinLiquorFine (x : Nat) : Bool :=
  decide (x <= liquorFineCap500k)

theorem threshold_value : liquorFineCap500k = 500000 := rfl

end JapanTaxLaw.LiquorFine500k
