import JapanTaxLaw.TaxFinance

/-!
# OkinawaArt19Bracket5M8M — 沖縄の復帰政令 art.19 (五百万円以上八百万円未満の金額)

Pinned source:
  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Enforcement: 2025-12-31

Normative unit: NORM|45d460c0948fd3d0bf385abdf4f6beba73ced2d26d84738a6d9305084e2c9456
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「五百万円以上八百万円未満の金額」

Reading (verbatim): 五百万 = 5,000,000 yen; 八百万 = 8,000,000 yen.
Money = Nat, unit = yen, domain = non-negative integers. `amount` is
caller-established. 「以上」 = inclusive lower (>= 5,000,000);
「未満」 = exclusive upper (< 8,000,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, other brackets, the base calculation and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket5M8M

open JapanTaxLaw.TaxFinance

/-- art.19 lower bound: 「五百万」 (yen). -/
def lowerBound : Money := 5_000_000
/-- art.19 upper bound: 「八百万」 (yen). -/
def upperBound : Money := 8_000_000

/-- Interval: 五百万円以上八百万円未満 (inclusive lower, exclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount >= lowerBound && amount < upperBound

example : lowerBound = 5_000_000 := by decide
example : upperBound = 8_000_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 4_999_999 = false := by decide
example : inBracket 5_000_000 = true := by decide
example : inBracket 7_999_999 = true := by decide
example : inBracket 8_000_000 = false := by decide

end JapanTaxLaw.OkinawaArt19Bracket5M8M
