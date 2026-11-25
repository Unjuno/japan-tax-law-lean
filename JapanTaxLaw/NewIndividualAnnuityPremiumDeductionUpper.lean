import JapanTaxLaw.TaxFinance

/-!
# NewIndividualAnnuityPremiumDeductionUpper — 新個人年金保険料控除 上段（地方税法 art.34 §1 四 ハ (iii)）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 34 §1 四 ハ (iii), flat/normalized leaf text 13009 chars. Needles contain no U+3000.

原文逐語:
  「...新個人年金保険料の金額の合計額が三万二千円を超え五万六千円以下である場合
    二万二千円と当該合計額から三万二千円を控除した金額の四分の一に相当する金額との合計額」

Computation（原文逐語から導出、上段の計算式のみ、単位: 円）:
  3.2万円 < total <= 5.6万円 のとき:
    deduction(total) = 22000 + (total - 32000) / 4  （1円未満切捨て）

Scope / NOT MODELLED:
  - 他区分（1.2万以下/1.2〜3.2万/5.6万超2.8万）・新生命/旧生命/介護/旧個人年金区分・7万円capは NOT MODELLED。
  - 「新個人年金保険契約等」の定義・生存死亡部分の判定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper

open JapanTaxLaw.TaxFinance

/-- 新個人年金保険料控除の上段計算式（3.2万円 < total <= 5.6万円）。 -/
def deduction (total : Money) : Money := 22000 + (total - 32000) / 4

example : deduction 32000 = 22000 := by decide
example : deduction 36000 = 23000 := by decide
example : deduction 56000 = 28000 := by decide -- 上限で 2.8万円

end JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper
