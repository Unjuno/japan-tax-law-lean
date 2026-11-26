import JapanTaxLaw.TaxFinance

/-!
# NationalTaxSmallBracket500k — 国税通則法 art. 66 (五十万円以下の部分に相当する税額)

Pinned source:
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Enforcement: 2026-11-01

Normative unit: NORM|1536f5c05d4f7fcf695531b882ef8f87188b0985d3a6dafd42dd1b1187cee81f
Source path: LawBody[2]/MainProvision/MainProvision[5]/Article:66/Article#66/Paragraph#3/Item#1/ItemSentence/Column#1/Sentence#1
Verbatim unit: 「五十万円以下の部分に相当する税額」

Reading (verbatim): 五十万 = 500,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the portion
of the 加算後累積納付税額 allocated to this bracket).
「以下」 = inclusive (≤ 500,000).

Scope: only the ¥500,000 bracket boundary and its inclusive comparison, which
identifies the lowest bracket of art. 66(3). The bracket's rate, the other
brackets, the aggregation and the 政令 calculation are NOT MODELLED. One
computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.NationalTaxSmallBracket500k

open JapanTaxLaw.TaxFinance

/-- art. 66(3)第一号: 「五十万」. Unit: yen; domain: Nat. -/
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

end JapanTaxLaw.NationalTaxSmallBracket500k
