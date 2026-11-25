import JapanTaxLaw.TaxFinance

/-!
# LocalCapitalCeiling10M — 地方税法 art.52 ホ 資本金等の額 千万円以下（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「…資本金等の額が千万円以下であるもの」
Computation（金額要件のみ、単位: 円）:
  withinCeiling(capital) = capital <= 10000000  （「以下」は境界値を含む）
Scope / NOT MODELLED: 法人の区分（独立行政法人・ニに掲げる法人の除外）・課税標準・税額計算は
NOT MODELLED。本モデルは 1000万円の上限判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalCapitalCeiling10M

open JapanTaxLaw.TaxFinance

def capitalCeiling : Money := 10000000

def withinCeiling (capital : Money) : Bool :=
  capital <= capitalCeiling

example : withinCeiling 10000000 = true := by decide
example : withinCeiling 10000001 = false := by decide

end JapanTaxLaw.LocalCapitalCeiling10M
