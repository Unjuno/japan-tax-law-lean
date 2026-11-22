import JapanTaxLaw.TaxFinance

/-!
# ShareholdersUnder50 — 租税特別措置法施行令 art. 39_10_2（五十人未満の株主から取得）

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

Pinned 原文: 「当該株式交付により当該株式交付子会社の株式を五十人以上の当該株式交付子会社の株主から取得をした場合」

Scoped claim: only the 五十人未満の株主から取得 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ShareholdersUnder50

def shareholderLimit50 : Nat := 50

def hasUnder50Shareholders (x : Nat) : Bool :=
  decide (x < shareholderLimit50)

theorem threshold_value : shareholderLimit50 = 50 := rfl

end JapanTaxLaw.ShareholdersUnder50
