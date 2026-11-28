import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt23IncomeCeiling5M — 地方税法 art.23 前年合計所得金額500万円以下 bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|20023274153ede974e448682730839241c024ddddff2cd0a418d2dfa8805f544
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:23/Article#23/Paragraph#1/Item#11/Subitem1#1/Subitem2#2/Subitem2Sentence/Sentence#1

原文逐語: 「前年の合計所得金額が五百万円以下であること。」

Computation（原文逐語から導出、金額上限スライスのみ、単位: 円）:
  ceiling := 5000000（五百万円、以下を含む）
  withinCeiling amount := amount <= 5000000

Scope / NOT MODELLED:
  - 合計所得金額の算定・前年の認定・他の号との併用は NOT MODELLED。
  - 本モデルは当該細目の上限判定のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt23IncomeCeiling5M

/-- 原文の上限（五百万円、含む）。 -/
def ceiling : Nat := 5000000

/-- 前年の合計所得金額が500万円以下か。 -/
def withinCeiling (amount : Nat) : Bool :=
  amount <= ceiling

example : withinCeiling 0 = true := by decide
example : withinCeiling 4999999 = true := by decide
example : withinCeiling 5000000 = true := by decide
example : withinCeiling 5000001 = false := by decide

end JapanTaxLaw.LocalTaxArt23IncomeCeiling5M
