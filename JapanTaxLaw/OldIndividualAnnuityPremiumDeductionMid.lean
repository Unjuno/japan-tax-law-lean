import JapanTaxLaw.TaxFinance

/-!
# OldIndividualAnnuityPremiumDeductionMid — 旧個人年金保険料控除 中段（地方税法 art.34 §1 四 ハ (2)(ii)）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 34 §1 四 ハ (2)(ii), flat/normalized leaf text 13009 chars. Needles contain no U+3000.

原文逐語:
  「...旧個人年金保険料の金額の合計額が一万五千円を超え四万円以下である場合
    一万五千円と当該合計額から一万五千円を控除した金額の二分の一に相当する金額との合計額」

Computation（原文逐語から導出、中段の計算式のみ、単位: 円）:
  1.5万円 < total <= 4万円 のとき:
    deduction(total) = 15000 + (total - 15000) / 2  （1円未満切捨て）

Scope / NOT MODELLED:
  - 他区分（1.5万以下/4万〜7万/7万超）・新生命/旧生命/介護/新個人年金区分・2.8万円 total cap は NOT MODELLED。
  - 剰余金/割戻金による払込み充ての控除は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.OldIndividualAnnuityPremiumDeductionMid

open JapanTaxLaw.TaxFinance

/-- 旧個人年金保険料控除の中段計算式（1.5万円 < total <= 4万円）。 -/
def deduction (total : Money) : Money := 15000 + (total - 15000) / 2

example : deduction 15000 = 15000 := by decide
example : deduction 16000 = 15500 := by decide
example : deduction 40000 = 27500 := by decide -- 上限で 2.75万円

end JapanTaxLaw.OldIndividualAnnuityPremiumDeductionMid
