import JapanTaxLaw.TaxFinance

/-!
# SpecialLand200 — 租税特別措置法 art. 69_4（計算面積合計 二百平方メートル以下）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「次のイ、ロ及びハの規定により計算した面積の合計が二百平方メートル以下であること。」

Scoped claim: only the 計算面積合計 二百平方メートル以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.SpecialLand200

def specialLandCap200 : Nat := 200

def withinSpecialLand200 (x : Nat) : Bool :=
  decide (x <= specialLandCap200)

theorem threshold_value : specialLandCap200 = 200 := rfl

end JapanTaxLaw.SpecialLand200
