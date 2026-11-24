import JapanTaxLaw.TaxFinance

/-!
# Warehouse3000sqm — 地方税法施行規則 art. 3_2_10（倉庫の床面積 三千平方メートル以上）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「倉庫（床面積が三千平方メートル以上のものに限る。）であつて、流通加工の用に供する空間を有するもの」

Scoped claim: only the 倉庫の床面積 三千平方メートル以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Warehouse3000sqm

def warehouseFloor3000 : Nat := 3000

def hasWarehouse3000 (x : Nat) : Bool :=
  decide (warehouseFloor3000 <= x)

theorem threshold_value : warehouseFloor3000 = 3000 := rfl

end JapanTaxLaw.Warehouse3000sqm
