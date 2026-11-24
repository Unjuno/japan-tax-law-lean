import JapanTaxLaw.TaxFinance

/-!
# CorpUnits31Art7 — 法人税法施行規則 art. 7（単位数 三十一単位以上）

Sources (pinned):

  Law id: 340M50000040012
  Revision: 340M50000040012_20261001_505M60000040013
  Raw snapshot: data/raw/340M50000040012_20261001_505M60000040013.law.json

Pinned 原文: 「その修業期間を通ずる単位数をその修業期間の年数で除して計算した単位数が三十一単位以上であること。」

Scoped claim: only the 単位数 三十一単位以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CorpUnits31Art7

def corpUnitsFloor31 : Nat := 31

def hasCorpUnits31 (x : Nat) : Bool :=
  decide (corpUnitsFloor31 <= x)

theorem threshold_value : corpUnitsFloor31 = 31 := rfl

end JapanTaxLaw.CorpUnits31Art7
