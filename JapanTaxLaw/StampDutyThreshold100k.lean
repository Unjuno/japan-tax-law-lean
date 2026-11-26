import JapanTaxLaw.TaxFinance

/-!
# StampDutyThreshold100k — 印紙税法 art. 4 (十万円を超える金額)

Pinned source:
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Enforcement: 2026-10-01

Normative unit: NORM|b0df6aef4d7d37f887aa42d8a9df6abad324059fdaed2fd3636a8ef9bbe69af6
Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:4/Article#4/Paragraph#4/Item#1/ItemSentence/Column#2/Sentence#1
Verbatim unit: 「十万円を超える金額」

Reading (verbatim): 十万 = 100,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established.
「超える」 = strict (> 100,000), exclusive at the boundary.

Scope: only the ¥100,000 threshold and its strict comparison. The tax
rates, the document categories, the calculation and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.StampDutyThreshold100k

open JapanTaxLaw.TaxFinance

/-- art. 4: 「十万」. Unit: yen; domain: Nat. -/
def threshold : Money := 100_000

/-- Strict test: 十万円を超える (exclusive at 100,000). -/
def exceedsThreshold (amount : Money) : Bool :=
  amount > threshold

example : threshold = 100_000 := by decide
example : exceedsThreshold 0 = false := by decide
example : exceedsThreshold 99_999 = false := by decide
example : exceedsThreshold 100_000 = false := by decide
example : exceedsThreshold 100_001 = true := by decide
example : exceedsThreshold 1_000_000 = true := by decide

end JapanTaxLaw.StampDutyThreshold100k
