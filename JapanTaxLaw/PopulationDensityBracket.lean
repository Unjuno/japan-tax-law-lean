import JapanTaxLaw.TaxFinance

/-!
# PopulationDensityBracket — 人口密度による区分（震災復興特別交付税 算定方法 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 507M60000008043
  Revision: 507M60000008043_20250425_000000000000000
  Raw snapshot: data/raw/507M60000008043_20250425_000000000000000.law.json
  Article Num 2, flat/normalized leaf text 32235 chars. Needles contain no U+3000.

原文逐語（公共下水道事業の人口密度区分、率は百分率を整数×100で表現）:
  処理区域内人口密度が二十五人毎ヘクタール未満 → 〇・七〇
  二十五人以上五十人毎ヘクタール未満 → 〇・六〇
  五十人以上七十五人毎ヘクタール未満 → 〇・五〇
  七十五人以上百人毎ヘクタール未満 → 〇・四〇
  百人毎ヘクタール以上 → 〇・三〇

Computation（原文逐語から導出、区分判定のみ、率は ×100 整数）:
  densityRate(d) =
    if d < 25 then 70
    else if d < 50 then 60
    else if d < 75 then 50
    else if d < 100 then 40
    else 30

Scope / NOT MODELLED:
  - 分流式の公共下水道事業・公共下水道事業以外・市場事業の区別は NOT MODELLED。
  - 処理区域内人口密度の算定方法・交付税額の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PopulationDensityBracket

open JapanTaxLaw.TaxFinance

/-- 人口密度（人/ha）による率（×100 整数）。 -/
def densityRate (density : Nat) : Nat :=
  if density < 25 then 70
  else if density < 50 then 60
  else if density < 75 then 50
  else if density < 100 then 40
  else 30

example : densityRate 24 = 70 := by decide
example : densityRate 25 = 60 := by decide
example : densityRate 50 = 50 := by decide
example : densityRate 75 = 40 := by decide
example : densityRate 100 = 30 := by decide

end JapanTaxLaw.PopulationDensityBracket
