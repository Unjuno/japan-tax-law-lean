import JapanTaxLaw.TaxFinance

/-!
# AmamiCostFloor5M — 奄美群島振興開発特別措置法施行令 art.1 (五百万円以上のもの)

Pinned source:
  Law id: 411M50000008014
  Revision: 411M50000008014_20240401_506M60000008035
  Enforcement: 2024-04-01

Normative unit: NORM|c84b2fde84cc466644104334326676ef74bb96231b546dde613f27cbcb104950
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#1/Item#1/Subitem1#1/Subitem2#2/Subitem2Sentence/Column#2/Sentence#1
Verbatim unit: 「五百万円以上のもの」

Reading (verbatim): 五百万 = 5,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the
取得価額 of machinery/apparatus for the local-tax non-uniform levy).
「以上」 = inclusive (≥ 5,000,000).

This law's name does not contain 「税」; it is a related statute discovered
through the 不均一課税 relation, acquired under source-layer L0.

Scope: only the ¥5,000,000 acquisition-cost floor and its inclusive comparison.
The non-uniform tax rate, the categories, the calculation and other paragraphs
are NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.AmamiCostFloor5M

open JapanTaxLaw.TaxFinance

/-- art.1: 「五百万」. Unit: yen; domain: Nat. -/
def costFloor : Money := 5_000_000

/-- Inclusive test: 五百万円以上 (true at 5,000,000). -/
def meetsFloor (amount : Money) : Bool :=
  amount >= costFloor

example : costFloor = 5_000_000 := by decide
example : meetsFloor 0 = false := by decide
example : meetsFloor 4_999_999 = false := by decide
example : meetsFloor 5_000_000 = true := by decide
example : meetsFloor 5_000_001 = true := by decide
example : meetsFloor 10_000_000 = true := by decide

end JapanTaxLaw.AmamiCostFloor5M
