import JapanTaxLaw.TaxFinance

/-!
# OkinawaArt19Bracket20M — 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令 art.19 (二千万円以上の金額)

Pinned source:
  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Enforcement: 2025-12-31

Normative unit: NORM|39f4f8364a3b42270ace8b5c071bc2a3b23b6a55b15fddd5f8fcdc00cb84079b
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「二千万円以上の金額」

Reading (verbatim): 二千万 = 20,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the amount
in this bracket of the art.19 table).
「以上」 = inclusive (≥ 20,000,000).

Scope: only the ¥20,000,000 bracket boundary and its inclusive comparison.
The bracket's rate, other brackets, the base calculation and other paragraphs
are NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket20M

open JapanTaxLaw.TaxFinance

/-- art.19: 「二千万」. Unit: yen; domain: Nat. -/
def bracketFloor : Money := 20_000_000

/-- Inclusive test: 二千万円以上 (true at 20,000,000). -/
def inTopBracket (amount : Money) : Bool :=
  amount >= bracketFloor

example : bracketFloor = 20_000_000 := by decide
example : inTopBracket 0 = false := by decide
example : inTopBracket 19_999_999 = false := by decide
example : inTopBracket 20_000_000 = true := by decide
example : inTopBracket 20_000_001 = true := by decide
example : inTopBracket 100_000_000 = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket20M
