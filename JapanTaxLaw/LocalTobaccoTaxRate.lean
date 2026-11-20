import JapanTaxLaw.TaxFinance

/-!
# LocalTobaccoTaxRate — 地方税法 art.74の5（たばこ税の税率）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Normative unit id:
    NORM|13ca7436618900441d6024641c3b92dbf2a9f48c038cee0927fb04970d4b22c6
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:74_5/
               Article#74_5/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「たばこ税の税率は、千本につき千七十円とする。」

Computation:
  千七十円 = 1,070 円 / 千本
  Variable: thousandCigarettes : Nat（千本単位の数量。caller-established）
  Unit: Money (= Nat, 円)。定義域: 千本あたりの定額税率。

Scope:
  本スライスは art.74の5 の税率定数のみを扱う。課税標準（製造本数・
  移動本数）の認定、市町村間の按分、附則・経過措置、他のたばこ税
  条項（課税定額等）は NOT MODELLED。
  法的妥当性は人間の独立レビューを要し、本モデルは法的レビューを提供しない。

All declarations are kernel-decided; no `sorry`, `admit`, `axiom`,
`Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.LocalTobaccoTaxRate

open JapanTaxLaw.TaxFinance

/-- art.74の5: 「千本につき千七十円」。単位は 円/千本。 -/
def ratePerThousand : Money := 1_070

/-- 原文定数の値。 -/
theorem ratePerThousand_value : ratePerThousand = 1_070 := by rfl

/-- 税率は正の自然数。 -/
theorem ratePerThousand_pos : 0 < ratePerThousand := by decide

/-- 桁違い（千円・一万円）を拒否する境界確認。 -/
theorem ratePerThousand_not_scaled :
    ratePerThousand ≠ 1_000 ∧ ratePerThousand ≠ 10_700 := by decide

example : ratePerThousand = 1_070 := by rfl
example : 0 < ratePerThousand := by decide
example : ratePerThousand ≠ 1_000 := by decide
example : ratePerThousand ≠ 10_700 := by decide

end JapanTaxLaw.LocalTobaccoTaxRate
