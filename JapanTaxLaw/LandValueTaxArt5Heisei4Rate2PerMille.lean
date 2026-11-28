import JapanTaxLaw.TaxFinance

/-!
# LandValueTaxArt5Heisei4Rate2PerMille — 地価税法 附則 art.5（平成4年 千分の二 税率）bounded L4 モデル

Sources (pinned):
  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068
  Raw snapshot: data/raw/403AC0000000069_20250601_504AC0000000068.law.json
  SHA-256: 0fe4bb9c6d07ff6e648db1d5bdb49af134af1b1f7563ea641ea8f87d4f72cbe2
  Norm unit NORM|50d05757712daa5f689b032ddaa7b568beaa084190832cd88df9b0cb05eca33f
  Source path: LawBody[3]/SupplProvision/SupplProvision[5]/Article:5/Article#5/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語:
  「平成四年の課税時期に係る地価税の税率については、第二十二条中「千分の三」とあるのは、「千分の二」とする。」

Computation（原文逐語から導出、税率読替スライスのみ、単位: 千分率）:
  originalPerMille := 3（千分の三）
  substitutedPerMille := 2（千分の二）
  appliedAmount base := base * 2 / 1000

Scope / NOT MODELLED:
  - 「平成四年の課税時期」の判定・適用年・他の附則条・課税価格算定は NOT MODELLED。
  - 端数処理の法的確定は NOT MODELLED。
  - 本モデルは computable slice のみ。人間による法的レビューは未了。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille

/-- 読替え前の千分率（千分の三）。 -/
def originalPerMille : Nat := 3

/-- 読替え後の千分率（千分の二）。 -/
def substitutedPerMille : Nat := 2

/-- 千分率の分母。 -/
def perMilleDen : Nat := 1000

/-- 読替え後税率を適用した金額。 -/
def appliedAmount (base : Nat) : Nat :=
  base * substitutedPerMille / perMilleDen

example : originalPerMille = 3 := by decide
example : substitutedPerMille = 2 := by decide
example : appliedAmount 0 = 0 := by decide
example : appliedAmount 1000 = 2 := by decide
example : appliedAmount 500 = 1 := by decide
example : appliedAmount 499 = 0 := by decide

end JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille
