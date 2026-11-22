import JapanTaxLaw.TaxFinance

/-!
# LandArea400 — 租税特別措置法 art. 70の6の8（宅地等の面積の合計のうち四百平方メートル以下の部分）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「当該宅地等の面積の合計のうち四百平方メートル以下の部分」

Scoped claim: only the 400 m² land-area cap; the special-measure eligibility is caller-established.
-/

namespace JapanTaxLaw.LandArea400

def landAreaCap : Nat := 400

def withinLandArea (sqm : Nat) : Bool :=
  decide (sqm <= 400)

theorem threshold_value : landAreaCap = 400 := rfl

end JapanTaxLaw.LandArea400
