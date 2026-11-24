import JapanTaxLaw.TaxFinance

/-!
# BuildingSite150sqm — 租税特別措置法施行令 art. 43_3（建築面積 百五十平方メートル以上）

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

Pinned 原文: 「当該建築物に係る建築面積が百五十平方メートル以上であること。」

Scoped claim: only the 建築面積 百五十平方メートル以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.BuildingSite150sqm

def siteFloor150 : Nat := 150

def hasSite150 (x : Nat) : Bool :=
  decide (siteFloor150 <= x)

theorem threshold_value : siteFloor150 = 150 := rfl

end JapanTaxLaw.BuildingSite150sqm
