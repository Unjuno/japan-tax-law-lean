import JapanTaxLaw.TaxFinance

/-!
# LiquorOrderFine500k — 酒税の保全及び酒類業組合等に関する法律 art. 5（罰金 五十万円以下）

Sources (pinned):

  Law id: 328AC0000000007
  Revision: 328AC0000000007_20250601_504AC0000000068
  Raw snapshot: data/raw/328AC0000000007_20250601_504AC0000000068.law.json

Pinned 原文: 「前項の規定による命令に違反した者は、五十万円以下の罰金に処する。」

Scoped claim: only the 罰金 五十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LiquorOrderFine500k

def liquorOrderCap500k : Nat := 500000

def withinLiquorOrderFine (x : Nat) : Bool :=
  decide (x <= liquorOrderCap500k)

theorem threshold_value : liquorOrderCap500k = 500000 := rfl

end JapanTaxLaw.LiquorOrderFine500k
