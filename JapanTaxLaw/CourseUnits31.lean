import JapanTaxLaw.TaxFinance

/-!
# CourseUnits31 — 所得税法施行令 art. 11_3（修業期間の単位数 三十一単位以上）

Sources (pinned):

  Law id: 340CO0000000096
  Revision: 340CO0000000096_20260522_508CO0000000093
  Raw snapshot: data/raw/340CO0000000096_20260522_508CO0000000093.law.json

Pinned 原文: 「その修業期間を通ずる単位数をその修業期間の年数に相当する数で除して計算した単位数が三十一単位以上であること（次に掲げる場合には、それぞれ次に定める事項）。」

Scoped claim: only the 修業期間の単位数 三十一単位以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CourseUnits31

def unitsFloor31 : Nat := 31

def hasCourseUnits31 (x : Nat) : Bool :=
  decide (unitsFloor31 <= x)

theorem threshold_value : unitsFloor31 = 31 := rfl

end JapanTaxLaw.CourseUnits31
