import JapanTaxLaw.TaxFinance

/-!
# UrbanDev2000sqm — 租税特別措置法施行令 art. 25_4（施行地区の面積 二千平方メートル以上）

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

Pinned 原文: 「当該集約都市開発事業の施行される土地の区域（以下この項において「施行地区」という。）の面積が二千平方メートル以上であること。」

Scoped claim: only the 施行地区の面積 二千平方メートル以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.UrbanDev2000sqm

def urbanDevFloor2000 : Nat := 2000

def hasUrbanDev2000 (x : Nat) : Bool :=
  decide (urbanDevFloor2000 <= x)

theorem threshold_value : urbanDevFloor2000 = 2000 := rfl

end JapanTaxLaw.UrbanDev2000sqm
