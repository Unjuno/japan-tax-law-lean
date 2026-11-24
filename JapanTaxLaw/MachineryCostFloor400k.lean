import JapanTaxLaw.TaxFinance

/-!
# MachineryCostFloor400k — 租税特別措置法施行令 art. 27の12の4

Pinned source:
  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Enforcement: 2026-11-01
  Snapshot SHA-256: d0ad21a838fd3d2a3b107a001b91a31ee00c267dc776bcd608b0ef018cf5494d

Normative unit: NORM|3fde07139ef06bec48bde1f0d442767dd0da29eb07563b6c3705d90c73c8e84e
Source path: LawBody[3]/MainProvision/MainProvision[2]/Article:27_12_4/Article#27_12_4/Paragraph#2/Item#1/Subitem1#2/Subitem1Sentence/Column#2/Sentence#1
Verbatim unit: 「一台又は一基の取得価額が四十万円以上のもの」

Reading (verbatim): 四十万円 = 400,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `cost` (取得価額) is caller-established.

Scope: only the ¥400,000 acquisition-cost threshold and its inclusive
comparison. The surrounding category definition, the special-measure
calculation, and other articles are NOT MODELLED. One computable slice, not
an article- or law-level completion claim.
-/

namespace JapanTaxLaw.MachineryCostFloor400k

open JapanTaxLaw.TaxFinance

/-- art. 27の12の4: 「四十万円」. Unit: yen; domain: Nat. -/
def acquisitionCostFloor : Money := 400_000

/-- Inclusion test: 取得価額が四十万円以上 (inclusive at 400,000). -/
def qualifies (cost : Money) : Bool :=
  cost >= acquisitionCostFloor

example : acquisitionCostFloor = 400_000 := by decide
example : qualifies 0 = false := by decide
example : qualifies 399_999 = false := by decide
example : qualifies 400_000 = true := by decide
example : qualifies 400_001 = true := by decide
example : qualifies 1_000_000 = true := by decide

end JapanTaxLaw.MachineryCostFloor400k
