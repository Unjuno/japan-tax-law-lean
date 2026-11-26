import JapanTaxLaw.TaxFinance

/-!
# InheritanceBracket2M — 相続税法 art. 21の7 (二百万円以下の金額)

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Enforcement: 2026-04-01

Normative unit: NORM|c15d9fc007f9f3839fac4e9af8b4c4b0e8625df3c89ac6a180ca7fe82d66a49b
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「二百万円以下の金額」

Reading (verbatim): 二百万 = 2,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the amount in
this bracket of the art. 21の7 table). 「以下」 = inclusive (≤ 2,000,000).

Scope: only the ¥2,000,000 bracket boundary and its inclusive comparison.
The bracket's rate, other brackets, the base calculation and other paragraphs
are NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.InheritanceBracket2M

open JapanTaxLaw.TaxFinance

/-- art. 21の7: 「二百万」. Unit: yen; domain: Nat. -/
def bracketCap : Money := 2_000_000

/-- Inclusive test: 二百万円以下 (true at 2,000,000). -/
def inBracket (amount : Money) : Bool :=
  amount <= bracketCap

example : bracketCap = 2_000_000 := by decide
example : inBracket 0 = true := by decide
example : inBracket 1_999_999 = true := by decide
example : inBracket 2_000_000 = true := by decide
example : inBracket 2_000_001 = false := by decide
example : inBracket 10_000_000 = false := by decide

end JapanTaxLaw.InheritanceBracket2M
