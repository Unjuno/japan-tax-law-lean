import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresBracket400k950k — 租税特別措置法 art. 5 (四十万円以上九十五万円未満の金額)

Pinned source:
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Enforcement: 2026-11-01

Normative unit: NORM|bd58b479eddb67ddb3abddf1f6fbd458eb04c32139598f2f9558370d208dfcda
Source path: LawBody[79]/SupplProvision/SupplProvision[5]/Article:5/Article#5/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「四十万円以上九十五万円未満の金額」

Reading (verbatim): 四十万 = 400,000 yen; 九十五万 = 950,000 yen.
Money = Nat, unit = yen, domain = non-negative integers. `amount` is
caller-established. 「以上」 = inclusive lower (≥ 400,000);
「未満」 = exclusive upper (< 950,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, the other brackets, the base calculation and other paragraphs
are NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.SpecialMeasuresBracket400k950k

open JapanTaxLaw.TaxFinance

/-- art. 5 lower bound: 「四十万」 (yen). -/
def lowerBound : Money := 400_000
/-- art. 5 upper bound: 「九十五万」 (yen). -/
def upperBound : Money := 950_000

/-- Interval: 四十万円以上九十五万円未満 (inclusive lower, exclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount >= lowerBound && amount < upperBound

example : lowerBound = 400_000 := by decide
example : upperBound = 950_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 399_999 = false := by decide
example : inBracket 400_000 = true := by decide
example : inBracket 949_999 = true := by decide
example : inBracket 950_000 = false := by decide

end JapanTaxLaw.SpecialMeasuresBracket400k950k
