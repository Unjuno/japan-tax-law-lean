import JapanTaxLaw.TaxFinance

/-!
# ShareExchange50Under — 法人税法施行令 art. 119（株主の数 五十人未満）

Sources (pinned):

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json

Pinned 原文: 「当該適格株式交換等の直前において株主の数が五十人未満である株式交換完全子法人の株式の取得をした場合」

Scoped claim: only the 株主の数 五十人未満 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ShareExchange50Under

def shareLimit50 : Nat := 50

def under50 (x : Nat) : Bool :=
  decide (x < shareLimit50)

theorem threshold_value : shareLimit50 = 50 := rfl

end JapanTaxLaw.ShareExchange50Under
