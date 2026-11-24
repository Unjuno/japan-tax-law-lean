import JapanTaxLaw.TaxFinance

/-!
# CourseHours120 — 所得税法施行令 art. 11_3（授業時間数 百二十時間以上）

Sources (pinned):

  Law id: 340CO0000000096
  Revision: 340CO0000000096_20260522_508CO0000000093
  Raw snapshot: data/raw/340CO0000000096_20260522_508CO0000000093.law.json

Pinned 原文: 「その修業期間を通ずる対面により行う授業の授業時間数をその修業期間の年数に相当する数で除して計算した授業時間数が百二十時間以上であること。」

Scoped claim: only the 授業時間数 百二十時間以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CourseHours120

def courseFloor120 : Nat := 120

def hasCourse120 (x : Nat) : Bool :=
  decide (courseFloor120 <= x)

theorem threshold_value : courseFloor120 = 120 := rfl

end JapanTaxLaw.CourseHours120
