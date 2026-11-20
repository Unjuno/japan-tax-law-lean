import JapanTaxLaw.TaxFinance

/-!
# InternationalTouristTaxRate — 国際観光旅客税法 art.15（税率）bounded L4 モデル

Sources (pinned):
  Law id: 430AC0000000016
  Revision: 430AC0000000016_20260701_508AC0000000012
  Raw snapshot: data/raw/430AC0000000016_20260701_508AC0000000012.law.json
  Normative unit id: NORM|4cd756c89d1d4861be56ba03c83c189d8981f13a9d09cd010124885ebe50d245
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:15/Article#15/
               Paragraph#1/ParagraphSentence/Sentence#1
  Enforcement date: 2026-07-01

原文逐語（pinned, 一字一句改変なし）:
  「国際観光旅客税の税率は、本邦からの出国一回につき、三千円とする。」

Computation:
  三千円 = 3,000 円 / 出国一回
  Variables: departures : Nat（出国回数。呼出側で確定させる）
  Unit: Money (= Nat, 円)。定義域: 出国一回につきの定額。

Scope:
  本スライスは art.15(1) の税率定数のみを扱う。出国の認定、非課税・軽減、
 課税標準、申告・徴収手続、附則・経過措置は NOT MODELLED。
  法的妥当性は人間の独立レビューを要し、本モデルは法的レビューを提供しない。

All declarations are kernel-decided; no `sorry`, `admit`, `axiom`,
`Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.InternationalTouristTaxRate

open JapanTaxLaw.TaxFinance

/-- art.15(1): 「本邦からの出国一回につき、三千円」。 -/
def departureTaxRate : Money := 3_000

/-- 原文定数の値。（単位: 円 / 出国一回） -/
theorem departureTaxRate_value : departureTaxRate = 3_000 := by decide

/-- 税率は正の自然数。 -/
theorem departureTaxRate_pos : 0 < departureTaxRate := by decide

/-- 桁違い（三万円・三百円）を拒否する境界確認。 -/
theorem departureTaxRate_not_scaled : departureTaxRate ≠ 30_000 ∧ departureTaxRate ≠ 300 := by decide

example : departureTaxRate = 3_000 := by decide
example : 0 < departureTaxRate := by decide
example : departureTaxRate ≠ 30_000 := by decide
example : departureTaxRate ≠ 300 := by decide

end JapanTaxLaw.InternationalTouristTaxRate
