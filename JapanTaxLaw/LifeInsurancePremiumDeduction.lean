import JapanTaxLaw.TaxFinance

/-!
# LifeInsurancePremiumDeduction — 新生命保険料控除 中段（地方税法 art.34 §1 四 イ (ii)）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 34 §1 四 イ (ii), flat/normalized leaf text 13009 chars. Needles contain no U+3000.

原文逐語:
  「...新生命保険料の金額の合計額が一万二千円を超え三万二千円以下である場合
    一万二千円と当該合計額から一万二千円を控除した金額の二分の一に相当する金額との合計額」

Computation（原文逐語から導出、中段の計算式のみ、単位: 円）:
  1.2万円 < total <= 3.2万円 のとき:
    deduction(total) = 12000 + (total - 12000) / 2  （1円未満切捨て）

Scope / NOT MODELLED:
  - 其他の区分（1.2万円以下: 全額、3.2万円超: 2.2万円）は NOT MODELLED。
  - 旧生命保険料・介護医療保険料・個人年金保険料の区分・7万円 total cap は NOT MODELLED。
  - 「政令で定める」契約区分・適用場面は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LifeInsurancePremiumDeduction

open JapanTaxLaw.TaxFinance

/-- 新生命保険料控除の中段計算式（1.2万円 < total <= 3.2万円）。 -/
def deduction (total : Money) : Money := 12000 + (total - 12000) / 2

example : deduction 12000 = 12000 := by decide -- 境界（境界本身は (ii) の下限超だが式は連続）
example : deduction 13000 = 12500 := by decide
example : deduction 22000 = 17000 := by decide
example : deduction 32000 = 22000 := by decide -- 上限で 2.2万円

end JapanTaxLaw.LifeInsurancePremiumDeduction
