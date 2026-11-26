import JapanTaxLaw.TaxFinance

/-!
# OkinawaArt19Bracket600k1M — 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令 art.19 (六十万円以上百万円未満の金額)

Pinned source:
  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Enforcement: 2025-12-31

Normative unit: NORM|5eb5f2a383a4bcf10da68d001ebc7e53a8536b6ee52d785fae955dbabec6ffa6
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「六十万円以上百万円未満の金額」

Reading (verbatim): 六十万 = 600,000 yen; 百万 = 1,000,000 yen. Money = Nat,
unit = yen, domain = non-negative integers. `amount` is caller-established.
「以上」 = inclusive lower (≥ 600,000); 「未満」 = exclusive upper (< 1,000,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, other brackets, the base calculation and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket600k1M

open JapanTaxLaw.TaxFinance

/-- art.19 lower bound: 「六十万」 (yen). -/
def lowerBound : Money := 600_000
/-- art.19 upper bound: 「百万」 (yen). -/
def upperBound : Money := 1_000_000

/-- Bounded interval: 六十万円以上百万円未満 (inclusive lower, exclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount >= lowerBound && amount < upperBound

example : lowerBound = 600_000 := by decide
example : upperBound = 1_000_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 599_999 = false := by decide
example : inBracket 600_000 = true := by decide
example : inBracket 999_999 = true := by decide
example : inBracket 1_000_000 = false := by decide

end JapanTaxLaw.OkinawaArt19Bracket600k1M
