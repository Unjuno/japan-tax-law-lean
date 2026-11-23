import JapanTaxLaw.TreatyAssetCeiling100K

/-
# TreatyAssetCeiling100KSpec — independent spec for 租税条約等実施特例法施行令 art.6-3(16)(3)（十万円以下）

Pinned source:
  Law id: 362CO0000000335
  Revision: 362CO0000000335_20260521_506CO0000000150
  Snapshot: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
  Statutory article: 第六条の三(16)(3) — 特定取引契約資産額が十万円以下
  原文逐語: 「令和七年十二月三十一日における対象特定取引に係る特定取引契約資産額が十万円以下であること。」
  Normative unit: NORM|7e12ccd9d760be2c3ed177e4d172b5eea5ff1d350aa8eb4a23ee7313025e8ce8

The implementation states 以下 with the inclusive operator `amount <= ceiling`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ specAssetCeiling < amount)` — a different operator from `<=`. It
reuses NO implementation definition inside its own `spec*` defs; the universal
`agree_asset_ceiling` theorem is the only bridge, and the kernel checks it for
every Nat amount.

Not modelled: the reference date, 対象特定取引/特定取引契約資産額 definitions,
the gated legal effect, other items/paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.TreatyAssetCeiling100K

/-- Spec-local statutory value: 十万円 = ¥100,000. Independent of impl. -/
def specAssetCeiling : Nat := 100_000

/-- Independent formula: 以下 as `¬ ceiling < amount`. Uses `<`, not `<=`. -/
def specWithinAsset (amount : Nat) : Bool :=
  decide (¬ specAssetCeiling < amount)

/-- Universal, kernel-checked correspondence for every natural amount. -/
theorem agree_asset_ceiling (amount : Nat) :
    withinAssetCeiling amount = specWithinAsset amount := by
  unfold withinAssetCeiling assetCeiling specWithinAsset specAssetCeiling
  by_cases h : amount <= 100_000
  · have hn : ¬ 100_000 < amount := by omega
    simp [h, hn]
  · have hn : 100_000 < amount := by omega
    simp [h, hn]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specAssetGrid : Bool :=
  let c := specAssetCeiling
  [0, 1, c - 1, c, c + 1].all fun amount =>
    specWithinAsset amount == decide (amount <= c)

example : specAssetGrid = true := by decide

end JapanTaxLaw.TreatyAssetCeiling100K
