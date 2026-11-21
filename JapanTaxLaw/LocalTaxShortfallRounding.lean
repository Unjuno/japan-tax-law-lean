import JapanTaxLaw.TaxFinance

/-!
# LocalTaxShortfallRounding — 地方税等減収補てん臨時交付金 art.5（端数計算）bounded L4 モデル

Sources (pinned):
  Law id: 420M60000008116
  Revision: 420M60000008116_20081022_000000000000000
  Raw snapshot: data/raw/420M60000008116_20081022_000000000000000.law.json
  Article Num 5, flat/normalized leaf text 133 chars, U+3000 count 0.

原文逐語:
  「その算定の過程及び算定した額に五百円未満の端数があるときはその端数金額を切り捨て、
   五百円以上千円未満の端数があるときはその端数金額を千円として計算するものとする。」

Computation（原文逐語から導出、端数帯のみ）:
  端数 r = amount % 1000（0〜999）
  r < 500  → 切り捨て: amount - r
  500 ≤ r → 千円として計算: amount - r + 1000

Scope / NOT MODELLED:
  - 「特別な定めがある場合」の別规定は NOT MODELLED。
  - 交付金そのものの算定方法（算定基礎）は NOT MODELLED。
  - 本スライスは端数処理（千円単位への四捨五入）のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxShortfallRounding

open JapanTaxLaw.TaxFinance

/-- 千円未満の端数を二帯で処理（<500 切捨て、>=500 千円繰上）。 -/
def roundToThousand (amount : Money) : Money :=
  let r := amount % 1000
  if r < 500 then amount - r else amount - r + 1000

example : roundToThousand 0 = 0 := by decide
example : roundToThousand 499 = 0 := by decide
example : roundToThousand 500 = 1000 := by decide
example : roundToThousand 999 = 1000 := by decide
example : roundToThousand 1_000 = 1_000 := by decide
example : roundToThousand 1_499 = 1_000 := by decide
example : roundToThousand 1_500 = 2_000 := by decide

end JapanTaxLaw.LocalTaxShortfallRounding
