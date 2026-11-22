import JapanTaxLaw.TaxFinance

/-!
# SpecialLand400 — 租税特別措置法 art. 69_4（選択特例対象宅地等 面積合計 四百平方メートル以下）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「当該選択特例対象宅地等の面積の合計が四百平方メートル以下であること。」

Scoped claim: only the 選択特例対象宅地等 面積合計 四百平方メートル以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.SpecialLand400

def specialLandCap400 : Nat := 400

def withinSpecialLand400 (x : Nat) : Bool :=
  decide (x <= specialLandCap400)

theorem threshold_value : specialLandCap400 = 400 := rfl

end JapanTaxLaw.SpecialLand400
