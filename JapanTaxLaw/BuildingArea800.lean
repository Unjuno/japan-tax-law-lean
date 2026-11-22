import JapanTaxLaw.TaxFinance

/-!
# BuildingArea800 — 租税特別措置法 art. 70の6の8（建物の床面積の合計のうち八百平方メートル以下の部分）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「当該建物の床面積の合計のうち八百平方メートル以下の部分」

Scoped claim: only the 800 m² building-area cap; the special-measure eligibility is caller-established.
-/

namespace JapanTaxLaw.BuildingArea800

def buildingAreaCap : Nat := 800

def withinBuildingArea (sqm : Nat) : Bool :=
  decide (sqm <= 800)

theorem threshold_value : buildingAreaCap = 800 := rfl

end JapanTaxLaw.BuildingArea800
