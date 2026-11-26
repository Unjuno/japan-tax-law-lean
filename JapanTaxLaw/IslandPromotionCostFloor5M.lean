import JapanTaxLaw.TaxFinance

/-!
# IslandPromotionCostFloor5M — 離島振興法施行令 art.2 (五百万円以上のもの)

Pinned source:
  Law id: 405M50000008001
  Revision: 405M50000008001_20250401_507M60000008028
  Enforcement: 2025-04-01

Normative unit: NORM|579d95c03f11624ff66376ff32c85d2afd9886c3e0a3bc587fee36615dc727af
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/Item#1/Subitem1#1/Subitem2#2/Subitem2Sentence/Column#2/Sentence#1
Verbatim unit: 「五百万円以上のもの」

Reading (verbatim): 五百万 = 5,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established (the
取得価額 of machinery/apparatus for the local-tax non-uniform levy).
「以上」 = inclusive (≥ 5,000,000).

This law's name does not contain 「税」; it is a related statute discovered
through the 不均一課税 relation, acquired under source-layer L0.

Scope: only the ¥5,000,000 acquisition-cost floor and its inclusive
comparison. The non-uniform tax rate, the categories, the calculation and
other paragraphs are NOT MODELLED. One computable slice, not an article- or
law-level completion claim.
-/

namespace JapanTaxLaw.IslandPromotionCostFloor5M

open JapanTaxLaw.TaxFinance

/-- art.2: 「五百万」. Unit: yen; domain: Nat. -/
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

end JapanTaxLaw.IslandPromotionCostFloor5M
