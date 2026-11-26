import JapanTaxLaw.TaxFinance

/-!
# CustomsExcessPortion3M — 関税法 art. 12の3(3) (三百万円を超える部分に相当する税額)

Pinned source:
  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Enforcement: 2026-06-01

Normative unit: NORM|525106c63e66613142dbca1d783fc345ef26693d9e2cad75d59d1879c3e23df2
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/Item#3/ItemSentence/Column#1/Sentence#1
Verbatim unit: 「三百万円を超える部分に相当する税額」

Reading (verbatim): 三百万 = 3,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the portion
of the 加算後累積納付税額 allocated to this bracket).
「超える」 = strict (> 3,000,000), exclusive at the boundary.

Scope: only the ¥3,000,000 threshold and its strict comparison, which selects
the excess portion of art. 12の3(3). The bracket's rate, the other brackets,
the aggregation and the 政令 calculation are NOT MODELLED. One computable
slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.CustomsExcessPortion3M

open JapanTaxLaw.TaxFinance

/-- art. 12の3(3)第三号: 「三百万」. Unit: yen; domain: Nat. -/
def excessThreshold : Money := 3_000_000

/-- Strict test: 三百万円を超える (exclusive at 3,000,000). -/
def isExcess (amount : Money) : Bool :=
  amount > excessThreshold

example : excessThreshold = 3_000_000 := by decide
example : isExcess 0 = false := by decide
example : isExcess 2_999_999 = false := by decide
example : isExcess 3_000_000 = false := by decide
example : isExcess 3_000_001 = true := by decide
example : isExcess 10_000_000 = true := by decide

end JapanTaxLaw.CustomsExcessPortion3M
