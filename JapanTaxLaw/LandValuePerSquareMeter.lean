import JapanTaxLaw.TaxFinance

/-!
# LandValuePerSquareMeter — 一平方メートル当たりの更地の価額（政令 art.8）bounded L4 モデル

Sources (pinned):
  Law id: 403CO0000000174
  Revision: 403CO0000000174_20250722_507CO0000000249
  Raw snapshot: data/raw/403CO0000000174_20250722_507CO0000000249.law.json
  Article Num 8, flat/normalized leaf text 100 chars, U+3000 count 0.

原文逐語:
  「当該土地等に係る更地の価額を当該土地等の面積で除して計算した一平方メートル
   当たりの価額とする。」

Computation（原文逐語から導出、除算のみ）:
  valuePerSqm(bareLandValue, area) = bareLandValue / area
  自然数除算（切捨て）。area=0 は対象外（面積ゼロの土地は存在しない）。

Scope / NOT MODELLED:
  - 「更地の価額」の算定方法（法6条6項）は NOT MODELLED。
  - 面積の単位・測定、端数処理の法的取扱いは NOT MODELLED。
  - 本スライスは 価額 ÷ 面積 の除算操作のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LandValuePerSquareMeter

open JapanTaxLaw.TaxFinance

/-- 一平方メートル当たりの更地価額 = 更地価額 ÷ 面積。area=0 は 0 を返す。 -/
def valuePerSqm (bareLandValue : Money) (area : Money) : Money :=
  if area = 0 then 0 else bareLandValue / area

example : valuePerSqm 0 1 = 0 := by decide
example : valuePerSqm 1000 10 = 100 := by decide
example : valuePerSqm 1000 3 = 333 := by decide
example : valuePerSqm 1000 0 = 0 := by decide

end JapanTaxLaw.LandValuePerSquareMeter
