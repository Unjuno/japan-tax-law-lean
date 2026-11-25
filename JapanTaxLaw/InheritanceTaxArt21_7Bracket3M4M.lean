import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt21_7Bracket3M4M — 相続税法 art.21の7 表（三百万円超四百万円以下）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Norm unit NORM|ba11d2cd9757bba62e0170670bdbca61193022421bd60ba07507240125ccbaf1
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（表のセル）: 「三百万円を超え四百万円以下の金額」

Computation（原文逐語から導出、帯域判定スライスのみ、単位: 円）:
  lowerExclusive := 3_000_000（三百万円を超え）
  upperInclusive := 4_000_000（四百万円以下）
  inBracket amount := amount > 3_000_000 && amount <= 4_000_000

Scope / NOT MODELLED:
  - 表中の他の帯域、税率・控除額・適用主体は NOT MODELLED。
  - 本モデルは当該セルの条件のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M

open JapanTaxLaw.TaxFinance

/-- 下限（三百万円、含まない）。 -/
def lowerExclusive : Money := 3000000

/-- 上限（四百万円、含む）。 -/
def upperInclusive : Money := 4000000

/-- 当該表セル「三百万円を超え四百万円以下の金額」に該当するか。 -/
def inBracket (amount : Money) : Bool :=
  amount > lowerExclusive && amount <= upperInclusive

example : lowerExclusive = 3000000 := by decide
example : upperInclusive = 4000000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 2999999 = false := by decide
example : inBracket 3000000 = false := by decide
example : inBracket 3000001 = true := by decide
example : inBracket 4000000 = true := by decide
example : inBracket 4000001 = false := by decide

end JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M
