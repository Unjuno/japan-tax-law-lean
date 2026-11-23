import JapanTaxLaw.TaxFinance

/-!
# PopulationDensityBracketFY8 — 人口密度による区分（令和八年度分 震災復興特別交付税 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 508M60000008066
  Revision: 508M60000008066_20260427_000000000000000
  Raw snapshot: data/raw/508M60000008066_20260427_000000000000000.law.json
  Article Num 2, flat/normalized leaf text 42596 chars. Needles contain no U+3000.
  （令和七年度分は cycle-94 PopulationDensityBracket として別途形式化済み。本件は別法・別版。）

原文逐語（公共下水道事業の人口密度区分、率は百分率を整数×100で表現）:
  人口密度 <25人/ha → 〇・七〇 / 25〜50未満 → 〇・六〇 / 50〜75未満 → 〇・五〇
  75〜100未満 → 〇・四〇 / 100以上 → 〇・三〇

Computation（原文逐語から導出、区分判定のみ、率は ×100 整数）:
  densityRate(d) = if d<25 then 70 else if d<50 then 60 else if d<75 then 50
                   else if d<100 then 40 else 30

Scope / NOT MODELLED:
  - 分流式・公共下水道事業以外・市場事業の区別は NOT MODELLED。
  - 処理区域内人口密度の算定方法・交付税額の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PopulationDensityBracketFY8

open JapanTaxLaw.TaxFinance

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

end JapanTaxLaw.PopulationDensityBracketFY8
