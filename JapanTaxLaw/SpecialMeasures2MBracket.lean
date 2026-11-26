import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasures2MBracket — 租税特別措置法 art. 70の2の5 (二百万円以下の金額)

Pinned source:
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Enforcement: 2026-11-01

Normative unit: NORM|d3a66f4c2318bf25b70e76bc4dfefa974b74bd9b34ecc9e1aabcad77d8a78ca8
Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:70_2_5/Article#70_2_5/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「二百万円以下の金額」

Reading (verbatim): 二百万 = 2,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the amount
placed in this bracket of the table).
「以下」 = inclusive (≤ 2,000,000).

Scope: only the ¥2,000,000 bracket boundary and its inclusive comparison.
The bracket's rate, other brackets, the base calculation and other paragraphs
are NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.SpecialMeasures2MBracket

open JapanTaxLaw.TaxFinance

/-- art. 70の2の5: 「二百万」. Unit: yen; domain: Nat. -/
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

end JapanTaxLaw.SpecialMeasures2MBracket
