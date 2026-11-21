import JapanTaxLaw.TaxFinance

/-!
# PowderSakeQuantity — 酒税法施行令 art.12の3（粉末酒の数量計算）bounded L4 モデル

Sources (pinned):
  Law id: 337CO0000000097
  Revision: 337CO0000000097_20250401_507CO0000000006
  Raw snapshot: data/raw/337CO0000000097_20250401_507CO0000000006.law.json
  Article Num 12_3, flat/normalized leaf text 83 chars, U+3000 count 0.

原文逐語:
  「粉末酒の重量に〇・七三（一キログラム当たりのリットル数）を乗じて計算する方法とする。」

Computation（原文逐語から導出、乗数のみ）:
  係数 = 0.73（〇・七三、一キログラム当たりのリットル数）
  リットル数 = 重量(kg) × 0.73
  厳密表現として liters×100 = weightKg × 73 を採用（端数処理を仮定しない）。

Scope / NOT MODELLED:
  - リットル数への端数処理（切捨て/四捨五入）は本条文に明示なし → 未形式化。
  - 粉末酒の重量測定、法7条6項の定義・用途は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PowderSakeQuantity

open JapanTaxLaw.TaxFinance

/-- 係数 0.73 を 73/100 として、リットル数×100 = 重量kg×73 を返す。 -/
def litersTimes100 (weightKg : Nat) : Nat :=
  weightKg * 73

example : litersTimes100 0 = 0 := by decide
example : litersTimes100 1 = 73 := by decide
example : litersTimes100 10 = 730 := by decide
example : litersTimes100 100 = 7300 := by decide

end JapanTaxLaw.PowderSakeQuantity
