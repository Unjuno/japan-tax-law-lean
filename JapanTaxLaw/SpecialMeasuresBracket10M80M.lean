import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresBracket10M80M — 租税特別措置法 art.5 附則 (千万円以上八千万円未満の金額)

Pinned source:
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Enforcement: 2026-11-01

Normative unit: NORM|62f5cc4bbcea65fa1da837bb0ec429829f05651a40f4dcc9f285ce8d904c238a
Source path: LawBody[79]/SupplProvision/SupplProvision[5]/Article:5/Article#5/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「千万円以上八千万円未満の金額」

Reading (verbatim): 千万 = 10,000,000 yen; 八千万 = 80,000,000 yen.
Money = Nat, unit = yen, domain = non-negative integers. `amount` is
caller-established. 「以上」 = inclusive lower (>= 10,000,000);
「未満」 = exclusive upper (< 80,000,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, other brackets, the base calculation and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.SpecialMeasuresBracket10M80M

open JapanTaxLaw.TaxFinance

/-- art.5 lower bound: 「千万」 (yen). -/
def lowerBound : Money := 10_000_000
/-- art.5 upper bound: 「八千万」 (yen). -/
def upperBound : Money := 80_000_000

/-- Interval: 千万円以上八千万円未満 (inclusive lower, exclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount >= lowerBound && amount < upperBound

example : lowerBound = 10_000_000 := by decide
example : upperBound = 80_000_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 9_999_999 = false := by decide
example : inBracket 10_000_000 = true := by decide
example : inBracket 79_999_999 = true := by decide
example : inBracket 80_000_000 = false := by decide

end JapanTaxLaw.SpecialMeasuresBracket10M80M
