import JapanTaxLaw.TaxFinance

/-
# TreatyAssetCeiling100K — 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令 第六条の三(16)(3)
（令和七年十二月三十一日における対象特定取引に係る特定取引契約資産額が十万円以下であること）

Pinned source:
  Law id: 362CO0000000335
  Official title: 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令
  Law type: CabinetOrder (政令)
  Revision: 362CO0000000335_20260521_506CO0000000150
  Raw snapshot: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
  sha256: 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
  Statutory article: 第六条の三 (art. 6-3), 第十六項 (16), 第三号 (3)
  Source path: LawBody[2]/MainProvision/MainProvision[14]/Article:6_3/Article#6_3/
               Paragraph#16/Item#3/ItemSentence/Sentence#1
  Normative unit id: NORM|7e12ccd9d760be2c3ed177e4d172b5eea5ff1d350aa8eb4a23ee7313025e8ce8

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「令和七年十二月三十一日における対象特定取引に係る特定取引契約資産額が十万円以下であること。」

Variable contract:
  `assetCeiling : Nat := 100_000` = 十万円 (inclusive upper bound: 以下).
  `withinAssetCeiling amount : Bool := decide (amount <= assetCeiling)`.
  Unit 円; domain Nat (whole yen). 以下 = inclusive `<=`. An asset amount of
  exactly 十万円 qualifies; 100,001 does not.

Scope: ONLY this explicit numeric asset-amount condition is modelled. The
reference date 令和七年十二月三十一日, the identification of 対象特定取引 and
特定取引契約資産額, the legal effect this condition gates, other items and
paragraphs, and all enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TreatyAssetCeiling100K

/-- 十万円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def assetCeiling : Nat := 100_000

/-- 「特定取引契約資産額が十万円以下」: amount <= ¥100,000. -/
def withinAssetCeiling (amount : Nat) : Bool :=
  decide (amount <= assetCeiling)

/-- 以下 is inclusive: exactly 十万円 qualifies. -/
theorem ceiling_inclusive : withinAssetCeiling 100_000 = true := by
  unfold withinAssetCeiling assetCeiling
  decide

/-- One yen above the ceiling fails. -/
theorem first_above : withinAssetCeiling 100_001 = false := by
  unfold withinAssetCeiling assetCeiling
  decide

/-- Zero asset amount qualifies. -/
theorem zero_true : withinAssetCeiling 0 = true := by
  unfold withinAssetCeiling assetCeiling
  decide

end JapanTaxLaw.TreatyAssetCeiling100K
