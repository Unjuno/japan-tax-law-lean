import JapanTaxLaw.AntennaPowerCeiling

/-
# AntennaPowerCeilingSpec — independent spec for 登録免許税法施行令 第十二条

Pinned source:
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
  Article: 第十二条 (raw JSON Article attr.Num = "12")
  原文逐語: 「法別表第一第五十四号（二）に規定する政令で定める登録は、基本送信機の規模が空中線電力五百ワット以下の無線局の登録とする。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
  `specCeiling : Nat := 500` (五百ワット) and expresses 「空中線電力五百ワット以下」
  as `decide (watts <= specCeiling)` — an inclusive <= ceiling on whole watts.

No implementation identifier (`powerCeilingWatts`, `withinPowerCeiling`)
  appears in any independent `spec*` definition. The ONLY bridges are the
  universal, kernel-checked theorems `agreeCeiling` and `agreeWithin`, each proved
  by a pure `unfold ... ; rfl`; every constant named in those unfolds occurs in the
  corresponding goal. The agreement theorems are not independent formulas.

Variable contract: watts = 空中線電力 (Nat, W); 五百ワット以下 = watts <= 500
  INCLUSIVE. Not modelled (same as the implementation): 法別表第一第五十四号（二）,
  the rest of Article 12, other articles and the registration procedure.
-/

namespace JapanTaxLaw.AntennaPowerCeiling

/-- Spec-local ceiling: 五百ワット = 500 W. Independent of the impl. -/
def specCeiling : Nat := 500

/-- Independent 「空中線電力五百ワット以下」: watts <= 500 (inclusive). -/
def specWithin (watts : Nat) : Bool :=
  decide (watts <= specCeiling)

/-- Universal ceiling agreement, pure unfold bridge. -/
theorem agreeCeiling : powerCeilingWatts = specCeiling := by
  unfold powerCeilingWatts specCeiling
  rfl

/-- Universal within-ceiling agreement, pure unfold bridge. -/
theorem agreeWithin (watts : Nat) : withinPowerCeiling watts = specWithin watts := by
  unfold withinPowerCeiling specWithin powerCeilingWatts specCeiling
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specCeiling = 500 := by decide
example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 499 = true := by decide
example : specWithin 500 = true := by decide
example : specWithin 501 = false := by decide

end JapanTaxLaw.AntennaPowerCeiling
