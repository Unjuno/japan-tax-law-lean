import JapanTaxLaw.TaxFinance

/-!
# SpecialTaxOrderArt124Rate25To8 — 租税特別措置法施行令 附則 art.124(6) 千分の二十五→千分の八 読替え bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  SHA-256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Norm unit NORM|1ad608a3f773f8e50c3210cc3261900a8753f3ad5a5e078482d9e88959ed0057
  Source path: LawBody[334]/SupplProvision/SupplProvision[68]/Article:124/Article#124/Paragraph#6/ParagraphSentence/Sentence#2

原文逐語:
  「この場合において、同項中「千分の二十五」とあるのは、「千分の八」とする。」

Computation（原文逐語から導出、読替え後税率スライスのみ、単位: 千分率）:
  originalPerMille := 25（千分の二十五）
  substitutedPerMille := 8（千分の八）
  appliedPerMille := 8（読替え后の税率）

Scope / NOT MODELLED:
  - 「この場合」の適用要件、同項の他の読替え、課税標準・税額計算は NOT MODELLED。
  - 本モデルは当該読替え後の数値のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialTaxOrderArt124Rate25To8

/-- 読替え前の千分率（千分の二十五）。 -/
def originalPerMille : Nat := 25

/-- 読替え後の千分率（千分の八）。 -/
def substitutedPerMille : Nat := 8

/-- 読替え後の税率を適用した金額（単位: 円、千分率）。 -/
def appliedAmount (base : Nat) : Nat :=
  base * substitutedPerMille / 1000

example : originalPerMille = 25 := by decide
example : substitutedPerMille = 8 := by decide
example : appliedAmount 0 = 0 := by decide
example : appliedAmount 125 = 1 := by decide
example : appliedAmount 1000 = 8 := by decide
example : appliedAmount 1001 = 8 := by decide

end JapanTaxLaw.SpecialTaxOrderArt124Rate25To8
