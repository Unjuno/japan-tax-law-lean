import JapanTaxLaw.TaxFinance

/-!
# RawMaterialRatio — 関税定率法施行規則 art.1の2（原料価額の割合）bounded L4 モデル

Sources (pinned):
  Law id: 344M50000040016
  Revision: 344M50000040016_20260401_508M60000040016
  Raw snapshot: data/raw/344M50000040016_20260401_508M60000040016.law.json
  Article Num 1_2, flat/normalized leaf text 116 chars, U+3000 count 0.

原文逐語:
  「…に規定する財務省令で定める割合は、おおむね百分の六十とする。」

Computation（原文逐語から導出、割合定数のみ）:
  ratioNumer = 60, ratioDenom = 100（おおむね百分の六十）
  thresholdYen(goodsValue) = goodsValue * 60 / 100

Scope / NOT MODELLED:
  - 「おおむね」は近似を表すため、本スライスは 60/100 の算術閾値のみを扱い、
    「おおむね」の許容幅（法的解釈）は NOT MODELLED。
  - 法8条の2第1項の区分、第三国輸入の認定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RawMaterialRatio

open JapanTaxLaw.TaxFinance

/-- 原料価額割合 = 60/100。goodsValue に対する 60% の額。 -/
def thresholdYen (goodsValue : Money) : Money :=
  goodsValue * 60 / 100

example : thresholdYen 0 = 0 := by decide
example : thresholdYen 100 = 60 := by decide
example : thresholdYen 1000 = 600 := by decide
example : thresholdYen 10000 = 6000 := by decide

end JapanTaxLaw.RawMaterialRatio
