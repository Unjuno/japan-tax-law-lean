import JapanTaxLaw.TaxFinance

/-!
# OkinawaArt19Bracket1M2M — 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令 art.19 (百万円以上二百万円未満の金額)

Pinned source:
  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Enforcement: 2025-12-31

Normative unit: NORM|c37518f6277d17ffd19b6277d2b49745f85c9f1a6127062026c7a1025d6160a4
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「百万円以上二百万円未満の金額」

Reading (verbatim): 百万 = 1,000,000 yen; 二百万 = 2,000,000 yen.
Money = Nat, unit = yen, domain = non-negative integers. `amount` is
caller-established. 「以上」 = inclusive lower (≥ 1,000,000);
「未満」 = exclusive upper (< 2,000,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, other brackets, the base calculation and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket1M2M

open JapanTaxLaw.TaxFinance

/-- art.19 lower bound: 「百万」 (yen). -/
def lowerBound : Money := 1_000_000
/-- art.19 upper bound: 「二百万」 (yen). -/
def upperBound : Money := 2_000_000

/-- Interval: 百万円以上二百万円未満 (inclusive lower, exclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount >= lowerBound && amount < upperBound

example : lowerBound = 1_000_000 := by decide
example : upperBound = 2_000_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 999_999 = false := by decide
example : inBracket 1_000_000 = true := by decide
example : inBracket 1_999_999 = true := by decide
example : inBracket 2_000_000 = false := by decide

end JapanTaxLaw.OkinawaArt19Bracket1M2M
