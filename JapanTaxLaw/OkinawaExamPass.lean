import JapanTaxLaw.TaxFinance

/-!
# OkinawaExamPass — 沖縄特例試験 合格基準 (art.14) bounded L4 モデル

Sources (pinned):
  Law id: 347M50000040044
  Revision: 347M50000040044_19740711_349M50000040044
  Raw snapshot: data/raw/347M50000040044_19740711_349M50000040044.law.json
  Article Num 14, flat/normalized leaf text 110 chars, U+3000 count 0.

原文逐語:
  「沖繩特例試験の合格基準は、各試験科目の満点の合計数（次条において「総点数」という。）
   の百分の六十とする。ただし、一科目につき、その満点の百分の四十に満たないものが
   ある者は、不合格とすることができる。」

Computation（原文逐語から導出、数値閾値のみ）:
  passNumer = 60, passDenom = 100（総点数の百分の六十）
  subjectFloorNumer = 40, subjectFloorDenom = 100（一科目 満点の百分の四十）
  meetsTotalThreshold(total, score) = score*100 >= total*60
  belowSubjectFloor(full, score) = score*100 < full*40

Scope / NOT MODELLED:
  - 「不合格とすることができる」は裁量的規定であり、本スライスは算出された閾値判定のみを
    扱い、不合格决定の裁量行使は NOT MODELLED。
  - 試験科目数、満点、点数集計手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.OkinawaExamPass

open JapanTaxLaw.TaxFinance

/-- 合格閾値 = 総点数の 60/100。score*100 >= total*60 で判定。 -/
def meetsTotalThreshold (total score : Nat) : Bool :=
  score * 100 >= total * 60

/-- 一科目が満点の 40/100 未満か。score*100 < full*40。 -/
def belowSubjectFloor (full score : Nat) : Bool :=
  score * 100 < full * 40

example : meetsTotalThreshold 100 60 = true := by decide
example : meetsTotalThreshold 100 59 = false := by decide
example : meetsTotalThreshold 1000 600 = true := by decide
example : belowSubjectFloor 100 40 = false := by decide
example : belowSubjectFloor 100 39 = true := by decide

end JapanTaxLaw.OkinawaExamPass
