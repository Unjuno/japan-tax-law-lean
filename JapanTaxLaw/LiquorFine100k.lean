import JapanTaxLaw.TaxFinance

/-!
# LiquorFine100k — 酒税の保全及び酒類業組合等に関する法律 art. 101（過料 十万円以下）

Sources (pinned):

  Law id: 328AC0000000007
  Revision: 328AC0000000007_20250601_504AC0000000068
  Raw snapshot: data/raw/328AC0000000007_20250601_504AC0000000068.law.json

Pinned 原文: 「次の各号のいずれかに該当する場合においては、酒類業組合等の発起人、理事、監事若しくは清算人又は酒類製造業者若しくは酒類販売業者は、十万円以下の過料に処する。」

Scoped claim: only the 過料 十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LiquorFine100k

def liquorFineCap100k : Nat := 100000

def withinLiquorFine100k (x : Nat) : Bool :=
  decide (x <= liquorFineCap100k)

theorem threshold_value : liquorFineCap100k = 100000 := rfl

end JapanTaxLaw.LiquorFine100k
