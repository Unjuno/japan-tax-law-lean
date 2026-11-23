import JapanTaxLaw.TaxFinance

/-!
# QuakeFloor50sqm — 租税特別措置法施行規則 art. 18_21（要耐震改修住宅の床面積 五十平方メートル以上）

Sources (pinned):

  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json

Pinned 原文: 「当該要耐震改修住宅の床面積が五十平方メートル以上であること。」

Scoped claim: only the 要耐震改修住宅の床面積 五十平方メートル以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.QuakeFloor50sqm

def floorMin50 : Nat := 50

def hasFloor50 (x : Nat) : Bool :=
  decide (floorMin50 <= x)

theorem threshold_value : floorMin50 = 50 := rfl

end JapanTaxLaw.QuakeFloor50sqm
