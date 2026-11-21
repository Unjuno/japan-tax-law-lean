import JapanTaxLaw.DisasterReliefPenalty

/-
# DisasterReliefPenaltySpec — independent spec for 災害被害者租税減免法 第五条

Pinned source:
  Law id: 329AC0000000112
  Revision: 329AC0000000112_20250601_504AC0000000068
  Raw snapshot: data/raw/329AC0000000112_20250601_504AC0000000068.law.json
  sha256: e9fdb7f3e8e12c43d255f747e2533f5374b31454e03efd513bfe1f4c12d35943
  Article: 第五条 (raw JSON Article attr.Num = "5")
  Original needle:
  「第一項の規定による承認を受けないで同項の資材等又は製品等を譲り受けた者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constants
`specImprisonment : Nat := 1` (一年 = 1 年) and `specFine : Nat := 500_000`
(五十万円 = 500,000 円). It expresses 「以下」 as `decide (¬ specImprisonment < y)`
and `decide (¬ specFine < v)` — a STRICT `<` under negation, deliberately a
DIFFERENT operator from the implementation's non-strict `<=`. The two axes stay
dimensionally separate (年 vs 円); no cross-axis comparison is expressed.

The ONLY bridges are the universal, axiom-free theorems `agreeImprisonment` and
`agreeFine`, each proved by a pure `simp [Nat.not_lt]` rewrite after `unfold`:
the constructive theorem Nat.not_lt turns `¬ 1 < y` into `y <= 1` and
`¬ 500000 < v` into `v <= 500000`. No `by_cases`, no `omega`, no
`Classical.choice` is used in either bridge. No implementation identifier
(`imprisonmentCeiling`, `withinImprisonment`, `fineCeiling`, `withinFine`)
appears in any independent `spec*` formula; the agreement theorems are not
independent formulas.

Variable contract: years = 拘禁刑の期間 (Nat, 年); yen = 罰金 (Nat, 円);
以下 is inclusive. Not modelled (same as the implementation): the approval
condition, 資材等・製品等 definitions, actor, sentencing, and other articles.

No `sorry`, `admit`, `axiom`, `Classical.choice`, `Monotone`, or struct literals.
-/

namespace JapanTaxLaw.DisasterReliefPenalty

/-- Spec-local imprisonment ceiling: 一年 = 1 (年, Nat). Independent of the impl. -/
def specImprisonment : Nat := 1

/-- Independent 「一年以下」: NOT (specImprisonment < y). Strict `<` + negation. -/
def specWithinImprisonment (y : Nat) : Bool :=
  decide (¬ specImprisonment < y)

/-- Spec-local fine ceiling: 五十万円 = 500_000 (円, Nat). Independent of the impl. -/
def specFine : Nat := 500_000

/-- Independent 「五十万円以下」: NOT (specFine < v). Strict `<` + negation. -/
def specWithinFine (v : Nat) : Bool :=
  decide (¬ specFine < v)

/-- Universal kernel bridge for every term of imprisonment (年).
    Pure constructive: `simp [Nat.not_lt]` rewrites `¬ 1 < y` to `y <= 1`;
    no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeImprisonment (y : Nat) :
    withinImprisonment y = specWithinImprisonment y := by
  unfold withinImprisonment specWithinImprisonment imprisonmentCeiling specImprisonment
  simp [Nat.not_lt]

/-- Universal kernel bridge for every fine amount (円).
    Pure constructive: `simp [Nat.not_lt]` rewrites `¬ 500000 < v` to
    `v <= 500000`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeFine (v : Nat) :
    withinFine v = specWithinFine v := by
  unfold withinFine specWithinFine fineCeiling specFine
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specWithinImprisonment 0 = true := by decide
example : specWithinImprisonment 1 = true := by decide
example : specWithinImprisonment 2 = false := by decide
example : specWithinFine 0 = true := by decide
example : specWithinFine 499_999 = true := by decide
example : specWithinFine 500_000 = true := by decide
example : specWithinFine 500_001 = false := by decide

end JapanTaxLaw.DisasterReliefPenalty
