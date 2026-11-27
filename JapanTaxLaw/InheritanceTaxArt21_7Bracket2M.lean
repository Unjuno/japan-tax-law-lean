import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt21_7Bracket2M — 相続税法 art.21の7 表（二百万円以下の金額）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Norm unit NORM|c15d9fc007f9f3839fac4e9af8b4c4b0e8625df3c89ac6a180ca7fe82d66a49b
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（表のセル）: 「二百万円以下の金額」

Computation（原文逐語から導出、帯域判定スライスのみ、単位: 円）:
  upperInclusive := 2000000（二百万円以下）
  inBracket amount := amount <= 2000000

Scope / NOT MODELLED:
  - 表中の他の帯域、贈与税額の計算・控除・申告は NOT MODELLED。
  - 本モデルは当該セルの条件のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt21_7Bracket2M

open JapanTaxLaw.TaxFinance

/-- 上限（二百万円、含む）。 -/
def upperInclusive : Money := 2000000

/-- 当該表セル「二百万円以下の金額」に該当するか。 -/
def inBracket (amount : Money) : Bool :=
  amount <= upperInclusive

example : upperInclusive = 2000000 := by decide
example : inBracket 0 = true := by decide
example : inBracket 1999999 = true := by decide
example : inBracket 2000000 = true := by decide
example : inBracket 2000001 = false := by decide

end JapanTaxLaw.InheritanceTaxArt21_7Bracket2M
