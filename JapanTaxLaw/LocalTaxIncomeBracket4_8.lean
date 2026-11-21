import JapanTaxLaw.TaxFinance

/-!
# LocalTaxIncomeBracket4_8 — 地方税法 第七十二条の二十四の七(1)第三号（年四百万円超年八百万円以下）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|5fabf587efefedb1bf83283e26ba09486268120cb013adc7cf04d058d359c414
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_24_7/Article#72_24_7/
               Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Statutory article: 第七十二条の二十四の七(1)第三号 — 年四百万円超年八百万円以下の金額

原文逐語（pinned, 一字一句改変なし）:
  「各事業年度の所得のうち年四百万円を超え年八百万円以下の金額」

Variable contract:
  `lowerBoundYen : Money := 4_000_000` = 四百万円 (exclusive lower bound: 超え).
  `upperBoundYen : Money := 8_000_000` = 八百万円 (inclusive upper bound: 以下).
  `inBracket income := lowerBoundYen < income ∧ income ≤ upperBoundYen`.
  Unit 円/year; domain Nat. 「超え」 = strict >; 「以下」 = ≤.

Scope: only this income bracket (a table cell in Article 72-24-7). The rate
applied to this bracket, other brackets, the surrounding computation, other
items/paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxIncomeBracket4_8

open JapanTaxLaw.TaxFinance

/-- 四百万円 — exclusive lower bound (超え). Unit 円/year; domain Nat. -/
def lowerBoundYen : Money := 4_000_000

/-- 八百万円 — inclusive upper bound (以下). Unit 円/year; domain Nat. -/
def upperBoundYen : Money := 8_000_000

/-- 「四百万円を超え八百万円以下」: strict lower, inclusive upper. -/
def inBracket (income : Money) : Prop :=
  lowerBoundYen < income ∧ income ≤ upperBoundYen

end JapanTaxLaw.LocalTaxIncomeBracket4_8
