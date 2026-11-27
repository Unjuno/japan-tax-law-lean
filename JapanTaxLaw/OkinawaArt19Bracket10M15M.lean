import JapanTaxLaw.TaxFinance

/-!
# OkinawaArt19Bracket10M15M — 沖縄の復帰政令 art.19 (千万円以上千五百万円未満の金額)

Pinned source:
  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Enforcement: 2025-12-31

Normative unit: NORM|19ad3c0f39ad4ec9480de4e7e90ab21b00a4f7dcf2ff45b75927e9e3c81f691e
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「千万円以上千五百万円未満の金額」

Reading (verbatim): 千万 = 10,000,000 yen; 千五百万 = 15,000,000 yen.
Money = Nat, unit = yen, domain = non-negative integers. `amount` is
caller-established. 「以上」 = inclusive lower (>= 10,000,000);
「未満」 = exclusive upper (< 15,000,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, other brackets, the base calculation and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket10M15M

open JapanTaxLaw.TaxFinance

/-- art.19 lower bound: 「千万」 (yen). -/
def lowerBound : Money := 10_000_000
/-- art.19 upper bound: 「千五百万」 (yen). -/
def upperBound : Money := 15_000_000

/-- Interval: 千万円以上千五百万円未満 (inclusive lower, exclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount >= lowerBound && amount < upperBound

example : lowerBound = 10_000_000 := by decide
example : upperBound = 15_000_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 9_999_999 = false := by decide
example : inBracket 10_000_000 = true := by decide
example : inBracket 14_999_999 = true := by decide
example : inBracket 15_000_000 = false := by decide

end JapanTaxLaw.OkinawaArt19Bracket10M15M
