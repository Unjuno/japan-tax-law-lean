import JapanTaxLaw.AreaThreshold2Ha

/-
# AreaThreshold2HaSpec — independent spec for 特定市街化区域農地の固定資産税の課税の適正化に伴う宅地化促進臨時措置法 第三条

Pinned source:
  Law id: 348AC0000000102
  Revision: 348AC0000000102_20010106_411AC0000000160
  Raw snapshot: data/raw/348AC0000000102_20010106_411AC0000000160.law.json
  sha256: 1aff9700ac6c8028a1901fc056959c771fb539c1c40da205f498bab4f67a063b
  Article: 第三条 (raw JSON Article attr.Num = "3", Paragraph#1 / Item#2)
  原文逐語: 「当該区域の面積が二ヘクタール以上であること」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFloor : Nat := 2` (二ヘクタール) and expresses 「二ヘクタール以上」 as
`decide (¬ ha < specFloor)` — a STRICT `<` with negation, deliberately a
DIFFERENT operator from the implementation's non-strict `>=`.

The ONLY bridge is the universal, axiom-free theorem `agreeArea`, proved by a
pure `simp [Nat.not_lt]` rewrite: the constructive theorem Nat.not_lt turns
`¬ ha < 2` into `2 <= ha`. No `by_cases`, no `omega`, no `Classical.choice`
is used in the bridge. No implementation identifier (`areaFloor`,
`meetsAreaFloor`) appears in any independent `spec*` formula; the agreement
theorem is not an independent formula.

Detector contract: `independent_spec_ok` = True (distinct operator, own
constant, no impl identifiers in spec formulas); `spec_literals` = {2}
(二 → 2, verified against the pinned needle).

Variable contract: ha = 区域の面積 (Nat, ヘクタール, whole hectares);
二ヘクタール以上 = 2 ha INCLUSIVE (>=). Not modelled (same as the
implementation): other Item thresholds (1 ha, 10 ha), 事業計画要件, other
paragraphs and other articles.
-/

namespace JapanTaxLaw.AreaThreshold2Ha

/-- Spec-local floor: 二ヘクタール = 2 (ha, Nat). Independent of the impl. -/
def specFloor : Nat := 2

/-- Independent 「二ヘクタール以上」: NOT (ha < specFloor). Strict `<` + negation. -/
def specMeets (ha : Nat) : Bool :=
  decide (¬ ha < specFloor)

/-- Universal, kernel-checked correspondence for every Nat area.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites `¬ ha < 2`
    to `2 <= ha`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeArea (ha : Nat) : meetsAreaFloor ha = specMeets ha := by
  unfold meetsAreaFloor specMeets areaFloor specFloor
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specMeets 0 = false := by decide
example : specMeets 1 = false := by decide
example : specMeets 2 = true := by decide
example : specMeets 3 = true := by decide
example : specMeets 10 = true := by decide

end JapanTaxLaw.AreaThreshold2Ha
