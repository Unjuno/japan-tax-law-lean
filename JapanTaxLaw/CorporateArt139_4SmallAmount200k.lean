import JapanTaxLaw.TaxFinance

/-!
# CorporateArt139_4SmallAmount200k — 法人税法施行令 art. 139の4 (二十万円未満である場合)

Pinned source:
  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Enforcement: 2026-10-01

Normative unit: NORM|d6935531b7cf6d81e6480be40135c346fbb83326ac4874d43acfb9eef55616e2
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:139_4/Article#139_4/Paragraph#2/Item#3/ItemSentence/Sentence#1
Verbatim unit: 「二十万円未満である場合」

Reading (verbatim): 二十万 = 200,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established.
「未満」 = strict upper bound (< 200,000), exclusive at the boundary.

Scope: only the ¥200,000 threshold and its strict comparison. The tax
calculation, the other items, the categories and other paragraphs are NOT
MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.CorporateArt139_4SmallAmount200k

open JapanTaxLaw.TaxFinance

/-- art. 139の4: 「二十万」. Unit: yen; domain: Nat. -/
def amountCap : Money := 200_000

/-- Strict test: 二十万円未満 (true below 200,000, false at 200,000). -/
def isSmall (amount : Money) : Bool :=
  amount < amountCap

example : amountCap = 200_000 := by decide
example : isSmall 0 = true := by decide
example : isSmall 199_999 = true := by decide
example : isSmall 200_000 = false := by decide
example : isSmall 200_001 = false := by decide
example : isSmall 1_000_000 = false := by decide

end JapanTaxLaw.CorporateArt139_4SmallAmount200k
