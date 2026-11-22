import JapanTaxLaw.TaxFinance

/-!
# TreatyDeduction — 日米相続税条約第四条の特定の控除（法律 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 329AC0000000194
  Revision: 329AC0000000194_20010106_411AC0000000160
  Raw snapshot: data/raw/329AC0000000194_20010106_411AC0000000160.law.json
  Article Num 2, flat/normalized leaf text 89 chars, U+3000 count 0.

原文逐語:
  「日米相続税条約第四条の規定による特定の控除は、これに相当する相続税法の規定に
   よる控除の額に同条に規定する割合を乗じて得た額に相当する額により行なうものとする。」

Computation（原文逐語から導出、法令間対応関係のみ）:
  条約控除額 = 相続税法の相当控除額 × 条約第四条の割合
  割合は条約側に規定され本条には数値が無いため、パラメータとして保持:
    treatyDeduction(internalDeduction, treatyRatioNum, treatyRatioDen)
      = internalDeduction * treatyRatioNum / treatyRatioDen

Scope / NOT MODELLED:
  - 条約第四条の「割合」の実際の数値（条約は別レイヤー、backlog）は NOT MODELLED。
  - 「相当する相続税法の規定」の特定・控除額の算定は NOT MODELLED。
  - 割合の端数処理は自然数除算（切捨て）で近似。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TreatyDeduction

open JapanTaxLaw.TaxFinance

/-- 条約控除額 = 国内控除額 × 条約割合(分子/分母)。割合はパラメータ。 -/
def treatyDeduction (internalDeduction : Money) (ratioNum ratioDen : Nat) : Money :=
  if ratioDen = 0 then 0 else internalDeduction * ratioNum / ratioDen

example : treatyDeduction 1000 1 2 = 500 := by decide
example : treatyDeduction 1000 3 4 = 750 := by decide
example : treatyDeduction 1000 1 0 = 0 := by decide

end JapanTaxLaw.TreatyDeduction
