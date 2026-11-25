import JapanTaxLaw.TaxFinance

/-!
# OldLifeInsurancePremiumDeductionUpper — 旧生命保険料控除 上段（地方税法 art.34 §1 四 ロ (iii)）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 34 §1 四 ロ (iii), flat/normalized leaf text 13009 chars. Needles contain no U+3000.

原文逐語:
  「...旧生命保険料の金額の合計額が四万円を超え七万円以下である場合
    二万七千五百円と当該合計額から四万円を控除した金額の四分の一に相当する金額との合計額」

Computation（原文逐語から導出、上段の計算式のみ、単位: 円）:
  4万円 < total <= 7万円 のとき:
    deduction(total) = 27500 + (total - 40000) / 4  （1円未満切捨て）

Scope / NOT MODELLED:
  - 他区分（4万以下/2万〜4万/7万超）・新生命/介護/個人年金区分・7万円 total cap は NOT MODELLED。
  - 「旧生命保険契約等」の定義・政令で定める契約区分は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper

open JapanTaxLaw.TaxFinance

/-- 旧生命保険料控除の上段計算式（4万円 < total <= 7万円）。 -/
def deduction (total : Money) : Money := 27500 + (total - 40000) / 4

example : deduction 40000 = 27500 := by decide
example : deduction 44000 = 28500 := by decide
example : deduction 70000 = 35000 := by decide -- 上限で 3.5万円

end JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper
