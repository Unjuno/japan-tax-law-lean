import JapanTaxLaw.TaxFinance

/-!
# ForestAreaRounding — 私有林人工林の面積補正の端数計算（規則 art.4）bounded L4 モデル

Sources (pinned):
  Law id: 431M60000008040
  Revision: 431M60000008040_20261021_508M60000008119
  Raw snapshot: data/raw/431M60000008040_20261021_508M60000008119.law.json
  Article Num 4, flat/normalized leaf text 88 chars, U+3000 count 0.

原文逐語:
  「…補正された後の数に一ヘクタール未満の端数があるときは、その端数を四捨五入する。」

Computation（原文逐語から導出、端数処理のみ）:
  面積を「1/10 ヘクタール」単位の整数で表現する（例: 25 = 2.5ha）。
  1 ヘクタール未満の端数を四捨五入して整数ヘクタールに丸める:
    roundHa(tenths) = (tenths + 5) / 10
  （端数 5 (0.5ha) 以上は繰上、4 (0.4ha) 以下は切捨て。）

Scope / NOT MODELLED:
  - 第1条の3の面積補正そのもの（係数・算定式）は NOT MODELLED。
  - 0.1ha より細かい端数（例 0.05ha）の厳密な取扱いは NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForestAreaRounding

open JapanTaxLaw.TaxFinance

/-- 1/10ha 単位を 1ha 単位へ四捨五入（端数 0.5ha 以上を繰上）。 -/
def roundHa (tenths : Nat) : Nat :=
  (tenths + 5) / 10

example : roundHa 0 = 0 := by decide
example : roundHa 4 = 0 := by decide
example : roundHa 5 = 1 := by decide
example : roundHa 14 = 1 := by decide
example : roundHa 15 = 2 := by decide
example : roundHa 25 = 3 := by decide

end JapanTaxLaw.ForestAreaRounding
