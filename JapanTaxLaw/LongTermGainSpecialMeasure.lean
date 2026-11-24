import JapanTaxLaw.TaxFinance

/-!
# LongTermGainSpecialMeasure — 優良住宅地造成等のための長期譲渡所得 課税の特例（地方税法 附則 art.34の2 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 34_2 §1, flat/normalized leaf text 3765 chars. Needles contain no U+3000.

原文逐語:
  「当該課税長期譲渡所得金額から二千万円を控除した金額の百分の二
    （当該納税義務者が指定都市の区域内に住所を有する場合には、百分の一）に相当する金額」

Computation（原文逐語から導出、控除額の計算式のみ、単位: 円）:
  base = taxableLongTermGain - 20000000（Nat 飽和で下限 0）
  measure(base, designatedCity) = base * (if designatedCity then 1 else 2) / 100

Scope / NOT MODELLED:
  - 優良住宅地等のための譲渡の認定・総務省令の証明方法は NOT MODELLED。
  - 適用年度（昭和63〜令和11）・所得割の他の計算・市町村民税側の特例は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LongTermGainSpecialMeasure

open JapanTaxLaw.TaxFinance

/-- 特例の基礎となる控除後金額（2000万円を控除、Nat 飽和）。 -/
def baseAfterDeduction (taxableGain : Money) : Money :=
  if taxableGain > 20000000 then taxableGain - 20000000 else 0

/-- 特例額 = base × 2%（指定都市は 1%）。 -/
def measure (taxableGain : Money) (designatedCity : Bool) : Money :=
  let b := baseAfterDeduction taxableGain
  if designatedCity then b / 100 else b * 2 / 100

example : baseAfterDeduction 20000000 = 0 := by decide
example : baseAfterDeduction 30000000 = 10000000 := by decide
example : measure 30000000 false = 200000 := by decide -- 1000万×2%
example : measure 30000000 true = 100000 := by decide  -- 指定都市 1%
example : measure 10000000 false = 0 := by decide

end JapanTaxLaw.LongTermGainSpecialMeasure
