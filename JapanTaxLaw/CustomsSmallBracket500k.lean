import JapanTaxLaw.TaxFinance

/-!
# CustomsSmallBracket500k — 関税法 art. 12の3 (五十万円以下の部分に相当する税額)

Pinned source:
  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Enforcement: 2026-06-01

Normative unit: NORM|1cf9da8c896be64495a6c3922e7f36b091614299e36a165462b003eb1e008dbe
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/Item#1/ItemSentence/Column#1/Sentence#1
Verbatim unit: 「五十万円以下の部分に相当する税額」

Reading (verbatim): 五十万 = 500,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the portion
of the 加算後累積納付税額 allocated to this bracket).
「以下」 = inclusive (≤ 500,000).

Scope: only the ¥500,000 bracket boundary and its inclusive comparison, which
identifies the lowest bracket of art. 12の3(3). The bracket's rate, the other
brackets, the aggregation, and the 政令 calculation are NOT MODELLED. One
computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.CustomsSmallBracket500k

open JapanTaxLaw.TaxFinance

/-- art. 12の3(3)第一号: 「五十万」. Unit: yen; domain: Nat. -/
def bracketCap : Money := 500_000

/-- Inclusive test: 五十万円以下 (true at 500,000). -/
def inSmallBracket (amount : Money) : Bool :=
  amount <= bracketCap

example : bracketCap = 500_000 := by decide
example : inSmallBracket 0 = true := by decide
example : inSmallBracket 499_999 = true := by decide
example : inSmallBracket 500_000 = true := by decide
example : inSmallBracket 500_001 = false := by decide
example : inSmallBracket 1_000_000 = false := by decide

end JapanTaxLaw.CustomsSmallBracket500k
