import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxBracket30M — 相続税法 art. 21の7 (三千万円を超える金額)

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Enforcement: 2026-04-01

Normative unit: NORM|7e19c12b92a5778bd5316fcf9548271de5a3256091b2addd3f1ec59619e759df
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
Verbatim unit: 「三千万円を超える金額」

Reading (verbatim): 三千万 = 30,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established.

Scope: only the ¥30,000,000 threshold and its strict (超える = exclusive)
comparison, which selects the top bracket of art. 21の7's table. The
bracket's rate and the other brackets/deductions are NOT MODELLED. One
computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.InheritanceTaxBracket30M

open JapanTaxLaw.TaxFinance

/-- art. 21の7: 「三千万」. Unit: yen; domain: Nat. -/
def bracketThreshold : Money := 30_000_000

/-- Strict test: 三千万円を超える (exclusive at 30,000,000). -/
def exceedsBracket (amount : Money) : Bool :=
  amount > bracketThreshold

example : bracketThreshold = 30_000_000 := by decide
example : exceedsBracket 0 = false := by decide
example : exceedsBracket 29_999_999 = false := by decide
example : exceedsBracket 30_000_000 = false := by decide
example : exceedsBracket 30_000_001 = true := by decide
example : exceedsBracket 100_000_000 = true := by decide

end JapanTaxLaw.InheritanceTaxBracket30M
