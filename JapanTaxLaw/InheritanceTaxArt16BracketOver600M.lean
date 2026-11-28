import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt16BracketOver600M — 相続税法 art.16 表（六億円を超える金額）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Norm unit NORM|b499e7ff816c3143182331132a1f1511d6e34881154b571c773d19feb4834159
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（表のセル）: 「六億円を超える金額」

Computation（原文逐語から導出、帯域判定スライスのみ、単位: 円）:
  lowerExclusive := 600000000（六億円を超える）
  inBracket amount := amount > 600000000

Scope / NOT MODELLED:
  - 表中の他の帯域、課税価格の算定・税率・控除は NOT MODELLED。
  - 本モデルは当該セルの条件のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt16BracketOver600M

open JapanTaxLaw.TaxFinance

/-- 下限（六億円、含まない）。 -/
def lowerExclusive : Money := 600000000

/-- 当該表セル「六億円を超える金額」に該当するか。 -/
def inBracket (amount : Money) : Bool :=
  amount > lowerExclusive

example : lowerExclusive = 600000000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 599999999 = false := by decide
example : inBracket 600000000 = false := by decide
example : inBracket 600000001 = true := by decide

end JapanTaxLaw.InheritanceTaxArt16BracketOver600M
