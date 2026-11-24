import JapanTaxLaw.TaxFinance

/-!
# GiftLand3000sqm — 租税特別措置法施行令 art. 40_23（敷地の面積 三千平方メートル以上）

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

Pinned 原文: 「当該建築物の敷地の面積が三千平方メートル以上であること。」

Scoped claim: only the 敷地の面積 三千平方メートル以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.GiftLand3000sqm

def giftLandFloor3000 : Nat := 3000000

def hasGiftLand3000 (x : Nat) : Bool :=
  decide (giftLandFloor3000 <= x)

theorem threshold_value : giftLandFloor3000 = 3000000 := rfl

end JapanTaxLaw.GiftLand3000sqm
