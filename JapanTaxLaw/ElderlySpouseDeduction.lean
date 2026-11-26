import JapanTaxLaw.TaxFinance

/-!
# ElderlySpouseDeduction — 老人控除対象配偶者控除の所得別定額（地方税法 art.37 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 37 §1, flat/normalized leaf text 1746 chars. Needles contain no U+3000.

原文逐語:
  「者が老人控除対象配偶者である場合十万円（当該納税義務者の前年の合計所得金額が
    九百万円を超え九百五十万円以下である場合には六万円、...九百五十万円を超え
    千万円以下である場合には三万円）」

Computation（原文逐語から導出、所得区分による定額、単位: 円）:
  deduction(income) =
    if income <= 9000000 then 100000
    else if income <= 9500000 then 60000
    else if income <= 10000000 then 30000
    else 0  （原文の区分外）

Scope / NOT MODELLED:
  - 「老人控除対象配偶者」の定義・認定・他の配偶者区分は NOT MODELLED。
  - 合計課税所得金額による調整控除・他の所得控除との通算は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ElderlySpouseDeduction

open JapanTaxLaw.TaxFinance

/-- 老人控除対象配偶者控除額（前年合計所得金額による区分）。 -/
def deduction (income : Money) : Money :=
  if income <= 9000000 then 100000
  else if income <= 9500000 then 60000
  else if income <= 10000000 then 30000
  else 0

example : deduction 9000000 = 100000 := by decide
example : deduction 9000001 = 60000 := by decide
example : deduction 9500000 = 60000 := by decide
example : deduction 9500001 = 30000 := by decide
example : deduction 10000001 = 0 := by decide

end JapanTaxLaw.ElderlySpouseDeduction
