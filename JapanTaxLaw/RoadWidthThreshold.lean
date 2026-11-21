import JapanTaxLaw.TaxFinance

/-!
# RoadWidthThreshold — 石油ガス譲与税法施行規則 art.1（道路の定義）bounded L4 モデル

Sources (pinned):
  Law id: 341M50000008002
  Revision: 341M50000008002_20191128_501M60000008059
  Raw snapshot: data/raw/341M50000008002_20191128_501M60000008059.law.json
  Article Num 1, flat/normalized leaf text 155 chars, U+3000 count 0.

原文逐語（幅員スライス）:
  「…路面幅員が二・五メートル未満である道路（橋梁を除く。）及び…」

Computation（原文逐語から導出、幅員閾値のみ）:
  widthThresholdDm = 25（2.5m = 25（1/10m 単位））
  isNarrowRoad(widthDm) = widthDm < 25（「未満」= 厳密に小さい）

Scope / NOT MODELLED:
  - 「渡船施設」「料金を徴収する道路」「橋梁を除く」の認定は NOT MODELLED。
  - 本スライスは路面幅員 2.5m 未満の数値判定のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RoadWidthThreshold

open JapanTaxLaw.TaxFinance

/-- 幅員閾値 = 2.5m = 25（1/10m 単位）。 -/
def widthThresholdDm : Nat := 25

/-- 「2.5m 未満」= 厳密に 25（1/10m 単位）より小さい。 -/
def isNarrowRoad (widthDm : Nat) : Bool :=
  widthDm < widthThresholdDm

example : widthThresholdDm = 25 := by decide
example : isNarrowRoad 0 = true := by decide
example : isNarrowRoad 24 = true := by decide
example : isNarrowRoad 25 = false := by decide
example : isNarrowRoad 26 = false := by decide

end JapanTaxLaw.RoadWidthThreshold
