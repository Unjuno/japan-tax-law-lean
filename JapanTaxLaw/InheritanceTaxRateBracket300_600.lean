import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxRateBracket300_600 — 相続税法 第十六条の表(1)（三億円超六億円以下）

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|ec5f9bde5640899be53231964b874ba37401d3fffb3b9da0ec18bf4d4f62a60d
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Statutory article: 第十六条の表(1) の税率区分（三億円超六億円以下の金額）

原文逐語（pinned, 一字一句改変なし）:
  「三億円を超え六億円以下の金額」

Variable contract:
  `lowerBoundYen : Money := 300_000_000` = 三億円 (exclusive lower bound: 超え).
  `upperBoundYen : Money := 600_000_000` = 六億円 (inclusive upper bound: 以下).
  `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
  Unit 円; domain Nat. 「超え」 = strict >; 「以下」 = ≤.

Scope: only this taxable-value bracket of the inheritance-tax rate table
(第十六条の表, an Article 16 TableStruct — not a 別表). The rate itself, other
brackets, base computation, deductions, the rest of the table, and other
paragraphs are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket300_600

open JapanTaxLaw.TaxFinance

/-- 三億円 — exclusive lower bound (超え). Unit 円; domain Nat. -/
def lowerBoundYen : Money := 300_000_000

/-- 六億円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def upperBoundYen : Money := 600_000_000

/-- 「三億円を超え六億円以下」: strict lower, inclusive upper. -/
def inBracket (taxableValue : Money) : Prop :=
  lowerBoundYen < taxableValue ∧ taxableValue ≤ upperBoundYen

end JapanTaxLaw.InheritanceTaxRateBracket300_600
