import JapanTaxLaw.TaxFinance

/-!
# InheritanceGiftTaxRateBracket2M3M — 相続税法 第二十一条の七（贈与税の税率）上欄区分

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|a1c39d3977b9d2a68fc6dd7125b555369ca7e764597c9b9c4673c8d94ae83941
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Statutory article: 第二十一条の七 — caption （贈与税の税率）; the bracket is the
  upper-column (上欄に掲げる金額) cell, a descriptive gloss (not a verbatim label),
    bracket 二百万円を超え三百万円以下の金額. The paired lower-column rate (15%) is a
    separate table cell / normative unit and is NOT modelled here.

原文逐語（pinned, 一字一句改変なし）:
  「二百万円を超え三百万円以下の金額」

Variable contract (円, domain Nat):
  lowerExclusiveYen = 2_000_000 (二百万円を超え — strictly greater)
  upperInclusiveYen = 3_000_000 (三百万円以下 — inclusive)
  inBracket amount := lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen
  「を超え」 = strict > (boundary excluded); 「以下」 = ≤ (boundary included).

Scope: only this rate-table bracket interval. The paired tax rate, the other brackets,
the deduction rules (前二条), other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M

open JapanTaxLaw.TaxFinance

/-- 二百万円 — lower bound, strictly excluded (を超え). -/
def lowerExclusiveYen : Money := 2_000_000

/-- 三百万円 — upper bound, inclusive (以下). -/
def upperInclusiveYen : Money := 3_000_000

/-- 二百万円を超え三百万円以下の金額. -/
def inBracket (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen

end JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M
