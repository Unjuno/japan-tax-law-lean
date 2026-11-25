import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxBracket10M30M — 相続税法 art. 16 (千万円を超え三千万円以下の金額)

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Enforcement: 2026-04-01

Normative unit: NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「千万円を超え三千万円以下の金額」

Reading (verbatim): 千万 = 10,000,000 yen; 三千万 = 30,000,000 yen.
Money = Nat, unit = yen, domain = non-negative integers. `amount` is
caller-established. 「超え」 = strict lower bound (> 10,000,000);
「以下」 = inclusive upper bound (≤ 30,000,000).

Scope: only this bounded interval predicate and its two boundaries. The
bracket's rate, the remaining brackets/deductions, and other articles are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.InheritanceTaxBracket10M30M

open JapanTaxLaw.TaxFinance

/-- art. 16 lower bound: 「千万」 (yen). -/
def lowerBound : Money := 10_000_000
/-- art. 16 upper bound: 「三千万」 (yen). -/
def upperBound : Money := 30_000_000

/-- Interval test: 千万円を超え三千万円以下 (strict lower, inclusive upper). -/
def inBracket (amount : Money) : Bool :=
  amount > lowerBound && amount <= upperBound

example : lowerBound = 10_000_000 := by decide
example : upperBound = 30_000_000 := by decide
example : inBracket 0 = false := by decide
example : inBracket 10_000_000 = false := by decide
example : inBracket 10_000_001 = true := by decide
example : inBracket 30_000_000 = true := by decide
example : inBracket 30_000_001 = false := by decide

end JapanTaxLaw.InheritanceTaxBracket10M30M
