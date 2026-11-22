import JapanTaxLaw.TaxFinance

/-
# ProductionVolume6KL — 酒税法施行規則 第十二条の二（製造見込数量六キロリットル以上）

Pinned source:
  Law id: 337CO0000000097
  Official title: 酒税法施行規則
  Law type: MinisterialOrdinance (省令)
  Revision: 337CO0000000097_20250401_507CO0000000006
  Raw snapshot: data/raw/337CO0000000097_20250401_507CO0000000006.law.json
  sha256: a0eb9311f04b00c430c604f8426cbafa48007530dfad8cdbd44f8ccb80d5879d
  Statutory article: 第十二条の二 (art. 12_2; raw JSON Article attr.Num = "12_2",
  Paragraph#1 / Item#2 — verified by independent re-extraction: the needle
  occurs verbatim once inside scoped Article 12_2 and once in the whole file).

原文逐語（pinned, 一字一句改変なし, CONDITION; scoped Article 12の2）:
  「一の製造場において原料用アルコール及びスピリッツを製造しようとする場合で、製造免許を受けた後一年間におけるその製造見込数量の合計が六キロリットル以上であるとき。」

Variable contract:
  `kl : Nat` = 製造見込数量の合計 (the projected production quantity for the
  year after receiving the manufacturing license), unit キロリットル (kL),
  whole kilolitres.
  `volumeFloorKL : Nat := 6` = 六キロリットル (6 kL).
  `meetsVolumeFloor (kl : Nat) : Bool := decide (volumeFloorKL <= kl)`;
  「以上」 is INCLUSIVE (>=), so exactly 6 kL meets the floor and 5 kL does not.

Scope: ONLY the explicit numeric volume threshold in the pinned needle is
  modelled — 六キロリットル = 6 kL and 「以上」 = inclusive >=. This is a volume
  threshold (unit kL), distinct from money, count or duration thresholds.
  The definitions of 原料用アルコール and スピリッツ, the licensing procedure,
  the other Items/paragraphs, other articles and all enforcement/operational
  rules are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `Classical.choice`, or monotonicity typeclass.
-/

namespace JapanTaxLaw.ProductionVolume6KL

/-- 六キロリットル = 6 kL. Unit キロリットル; domain Nat. -/
def volumeFloorKL : Nat := 6

/-- 「製造見込数量の合計が六キロリットル以上」: kl >= 6 (以上 = inclusive >=). -/
def meetsVolumeFloor (kl : Nat) : Bool :=
  decide (volumeFloorKL <= kl)

/-- 0 kL < 6 kL: the projected volume floor is not met. -/
theorem meetsVolumeFloor_0 : meetsVolumeFloor 0 = false := by decide

/-- 5 kL < 6 kL: just below the floor is not met. -/
theorem meetsVolumeFloor_5 : meetsVolumeFloor 5 = false := by decide

/-- Exactly 6 kL (六キロリットル) meets the floor: 以上 is inclusive. -/
theorem meetsVolumeFloor_6 : meetsVolumeFloor 6 = true := by decide

/-- 7 kL > 6 kL: just above the floor is met. -/
theorem meetsVolumeFloor_7 : meetsVolumeFloor 7 = true := by decide

/-- The pinned statutory value itself: 六キロリットル = 6. -/
theorem volumeFloorKL_value : volumeFloorKL = 6 := rfl

end JapanTaxLaw.ProductionVolume6KL
