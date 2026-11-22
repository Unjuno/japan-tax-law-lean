import JapanTaxLaw.TaxFinance

/-!
# SpecialLand330 — 租税特別措置法 art. 69_4（選択特例対象宅地等 三百三十平方メートル以下）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「当該選択特例対象宅地等の面積の合計が三百三十平方メートル以下であること。」

Scoped claim: only the 選択特例対象宅地等 三百三十平方メートル以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.SpecialLand330

def specialLandCap330 : Nat := 330

def withinSpecialLand330 (x : Nat) : Bool :=
  decide (x <= specialLandCap330)

theorem threshold_value : specialLandCap330 = 330 := rfl

end JapanTaxLaw.SpecialLand330
