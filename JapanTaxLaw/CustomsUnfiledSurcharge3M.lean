import JapanTaxLaw.TaxFinance

/-!
# CustomsUnfiledSurcharge3M — 関税法 art. 12の3 (加算後累積納付税額 三百万円超)

Pinned source:
  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Enforcement: 2026-06-01

Normative unit: NORM|3958fc3a40a3b23cc18914fd4b63859239081258599ec53e4a8e09d5911c2384
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/ParagraphSentence/Sentence#1
Verbatim unit: 「加算後累積納付税額 … が三百万円を超えるときは …
  その割合から百分の五を減じた割合 …」

Reading (verbatim): 三百万 = 3,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` (加算後累積納付税額) is
caller-established, including the 政令-defined deduction therein.
「百分の五」 = 5/100 = 1/20 (a rate ratio, numerator 5 denominator 100).

Scope: the ¥3,000,000 cumulative-paid-amount threshold (超える = exclusive)
and the verbatim 「百分の五」 rate ratio from the non-foreknown-filing clause.
The tiered brackets, the multiplication/aggregation, the 政令 calculation of
the deductible amount, and other articles/paragraphs are NOT MODELLED. One
computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.CustomsUnfiledSurcharge3M

open JapanTaxLaw.TaxFinance

/-- art. 12の3(3): 「三百万」. Unit: yen; domain: Nat. -/
def cumulativePaidThreshold : Money := 3_000_000

/-- Strict test: 加算後累積納付税額が三百万円を超える (exclusive at 3,000,000). -/
def exceedsThreshold (amount : Money) : Bool :=
  amount > cumulativePaidThreshold

/-- art. 12の3(3): 「百分の五」 = 5/100 = 1/20. Numerator, denominator (Nat). -/
def reductionNumerator : Nat := 5
def reductionDenominator : Nat := 100

example : cumulativePaidThreshold = 3_000_000 := by decide
example : exceedsThreshold 0 = false := by decide
example : exceedsThreshold 2_999_999 = false := by decide
example : exceedsThreshold 3_000_000 = false := by decide
example : exceedsThreshold 3_000_001 = true := by decide
example : exceedsThreshold 10_000_000 = true := by decide
example : reductionNumerator * 20 = reductionDenominator := by decide

end JapanTaxLaw.CustomsUnfiledSurcharge3M
