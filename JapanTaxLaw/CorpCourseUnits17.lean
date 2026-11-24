import JapanTaxLaw.TaxFinance

/-!
# CorpCourseUnits17 — 法人税法施行規則 art. 7（単位数 十七単位以上）

Sources (pinned):

  Law id: 340M50000040012
  Revision: 340M50000040012_20261001_505M60000040013
  Raw snapshot: data/raw/340M50000040012_20261001_505M60000040013.law.json

Pinned 原文: 「その修業期間を通ずる単位数をその修業期間の年数で除して計算した単位数が十七単位以上であること。」

Scoped claim: only the 単位数 十七単位以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CorpCourseUnits17

def corpUnitsFloor17 : Nat := 17

def hasCorpUnits17 (x : Nat) : Bool :=
  decide (corpUnitsFloor17 <= x)

theorem threshold_value : corpUnitsFloor17 = 17 := rfl

end JapanTaxLaw.CorpCourseUnits17
