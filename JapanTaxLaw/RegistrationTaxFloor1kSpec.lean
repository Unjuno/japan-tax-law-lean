import JapanTaxLaw.RegistrationTaxFloor1k

/-
# RegistrationTaxFloor1kSpec — independent spec for 登録免許税法 第十九条（下限千円）

Pinned source:
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  sha256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15
  Article: 第十九条 (attr.Num = "19", MainProvision)
  原文逐語: 「別表第一に掲げる登記又は登録につき同表に掲げる税率を適用して計算した金額が千円に満たない場合には、当該登記又は登録に係る登録免許税の額は、千円とする。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFloor : Nat := 1000` (千円) and its OWN minimum-floor function
`specTax (computed : Nat) : Nat := max computed specFloor`. No implementation
identifier (`minimumTax`, `taxWithFloor`) appears in any spec* definition.
The only bridges are the kernel-checked theorems `agreeFloor` and `agreeTax`.

spec_literals = {1000} — 千, source-verified verbatim in the pinned needle.

Not modelled (same as the implementation): the 別表第一 rates/fees (other
modules), the rate computation itself, other articles and enforcement rules.
-/

namespace JapanTaxLaw.RegistrationTaxFloor1k

/-- Spec-local 千円 = ¥1,000. Unit 円; domain Nat. Independent of the impl. -/
def specFloor : Nat := 1000

/-- Spec-local minimum-floor tax: max(computed, specFloor). Independent of the impl. -/
def specTax (computed : Nat) : Nat := max computed specFloor

theorem agreeFloor : minimumTax = specFloor := by unfold minimumTax specFloor; rfl

theorem agreeTax (computed : Nat) : taxWithFloor computed = specTax computed := by
  unfold taxWithFloor specTax minimumTax specFloor
  rfl

end JapanTaxLaw.RegistrationTaxFloor1k
