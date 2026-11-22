import JapanTaxLaw.ProductionVolume6KL

/-
# ProductionVolume6KLSpec — independent spec for 酒税法施行規則 第十二条の二（六キロリットル以上）

Pinned source:
  Law id: 337CO0000000097
  Revision: 337CO0000000097_20250401_507CO0000000006
  Raw snapshot: data/raw/337CO0000000097_20250401_507CO0000000006.law.json
  sha256: a0eb9311f04b00c430c604f8426cbafa48007530dfad8cdbd44f8ccb80d5879d
  Article: 第十二条の二 (attr.Num = "12_2", Paragraph#1 / Item#2)
  原文逐語: 「一の製造場において原料用アルコール及びスピリッツを製造しようとする場合で、製造免許を受けた後一年間におけるその製造見込数量の合計が六キロリットル以上であるとき。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFloor : Nat := 6` (六キロリットル) and its OWN inclusive floor test
`specMeets (kl : Nat) : Bool := decide (specFloor <= kl)`. No implementation
identifier (`volumeFloorKL`, `meetsVolumeFloor`) occurs in any spec* definition.
The only bridges are the kernel-checked theorems `agreeFloor` and `agreeMeets`.

spec_literals = {6} — 六, source-verified verbatim in the pinned needle.

Not modelled (same as the implementation): the definitions of the two spirits,
the licensing procedure, other Items/paragraphs, other articles and enforcement
rules. The floor is INCLUSIVE (以上 = >=), unit キロリットル (kL).
-/

namespace JapanTaxLaw.ProductionVolume6KL

/-- Spec-local 六キロリットル = 6 kL. Unit キロリットル; domain Nat. Independent of the impl. -/
def specFloor : Nat := 6

/-- Spec-local floor test: kl >= 6 kL (以上 = inclusive). Independent of the impl. -/
def specMeets (kl : Nat) : Bool :=
  decide (specFloor <= kl)

/-- Universal, kernel-checked floor bridge. Pure `unfold ... ; rfl`. -/
theorem agreeFloor : volumeFloorKL = specFloor := by unfold volumeFloorKL specFloor; rfl

/-- Universal, kernel-checked meets bridge. Pure `unfold ... ; rfl`. -/
theorem agreeMeets (kl : Nat) : meetsVolumeFloor kl = specMeets kl := by
  unfold meetsVolumeFloor specMeets volumeFloorKL specFloor
  rfl

end JapanTaxLaw.ProductionVolume6KL
