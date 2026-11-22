import JapanTaxLaw.TaxFinance

/-!
# ResidentialLandArea200 — 地方税法 art. 349の3の二（住宅用地の面積 二百平方メートル以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「住宅用地でその面積が二百平方メートル以下であるもの」

Scoped claim: only the 200 m² area threshold for 住宅用地. Whether a parcel
qualifies as 住宅用地 and the other conditions of the article are caller-established.
-/

namespace JapanTaxLaw.ResidentialLandArea200

def areaThresholdSqm : Nat := 200

def withinArea (sqm : Nat) : Bool :=
  decide (sqm <= areaThresholdSqm)

theorem threshold_value : areaThresholdSqm = 200 := rfl

end JapanTaxLaw.ResidentialLandArea200
