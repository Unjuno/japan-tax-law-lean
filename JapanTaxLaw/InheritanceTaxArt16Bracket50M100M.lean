import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt16Bracket50M100M — 相続税法 art.16 表（五千万円超一億円以下）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Norm unit NORM|df94f143188b89690e03047e002c6a375e81d8d3c81f4313c1995b484310badc
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（表のセル）: 「五千万円を超え一億円以下の金額」

Computation（原文逐語から導出、帯域判定スライスのみ、単位: 円）:
  lowerExclusive := 50_000_000（五千万円を超え）
  upperInclusive := 100_000_000（一億円以下）
  inBracket amount := amount > 50_000_000 && amount <= 100_000_000

Scope / NOT MODELLED:
  - 表中の他の帯域、課税価格の算定・税率・控除は NOT MODELLED。
  - 本モデルは当該セルの条件のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt16Bracket50M100M

open JapanTaxLaw.TaxFinance

/-- 下限（五千万円、含まない）。 -/
def lowerExclusive : Money := 50000000

/-- 上限（一億円、含む）。 -/
def upperInclusive : Money := 100000000

/-- 当該表セル「五千万円を超え一億円以下の金額」に該当するか。 -/
def inBracket (amount : Money) : Bool :=
  amount > lowerExclusive && amount <= upperInclusive

example : lowerExclusive = 50000000 := by decide
example : upperInclusive = 100000000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 49999999 = false := by decide
example : inBracket 50000000 = false := by decide
example : inBracket 50000001 = true := by decide
example : inBracket 100000000 = true := by decide
example : inBracket 100000001 = false := by decide

end JapanTaxLaw.InheritanceTaxArt16Bracket50M100M
