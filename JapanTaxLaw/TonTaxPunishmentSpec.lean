import JapanTaxLaw.TonTaxPunishment

/-
# TonTaxPunishmentSpec — independent spec for とん税法 第十二条（罰則）

Pinned source: law 332AC0000000037,
  revision 332AC0000000037_20250601_504AC0000000068,
  raw snapshot data/raw/332AC0000000037_20250601_504AC0000000068.law.json,
  article 第十二条 (attr.Num = "12").

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specImprisonmentCeiling : Nat := 3` (三年, unit 年) and
`specFineCeiling : Nat := 500_000` (五十万, unit 円). The ceilings are expressed
with the DIFFERENT operators `¬ n > c` (strict `>` plus negation) instead of the
implementation's non-strict `<=`. No implementation identifier appears in any
independent formula below.

併科 (concurrent imposition of both penalties) is a rule DISTINCT from the two
numeric ceilings; it is modelled by the `imprisoned = true ∨ fined = true`
clause. The dimensional separation 年 vs 円 is preserved: `years` is compared
only to the 年 ceiling, `yen` only to the 円 ceiling.

The ONLY impl/spec bridges are the universal kernel-checked theorems
`specWithinImprisonment_prop`, `specWithinFine_prop` and `agreeSentence`, all
proved with `omega`. Spot-checks and the agreement theorem are scaffolding,
not independent statutory formulas.
-/

namespace JapanTaxLaw.TonTaxPunishment

/-- Spec-local 三年 = 3. Unit 年. Independent of the implementation. -/
def specImprisonmentCeiling : Nat := 3

/-- Spec-local 五十万 = 500,000. Unit 円. Independent of the implementation. -/
def specFineCeiling : Nat := 500_000

/-- Independent 「三年以下」: NOT (years > 3). Strict `>` + negation, a
    different operator from the implementation's `<=`. -/
def specWithinImprisonment (years : Nat) : Bool :=
  decide (¬ years > specImprisonmentCeiling)

/-- Independent 「五十万円以下」: NOT (yen > 500000). -/
def specWithinFine (yen : Nat) : Bool :=
  decide (¬ yen > specFineCeiling)

/-- Independent sentence validity: no applied component exceeds its own ceiling
    and at least one component is applied (併科 / 若しくは). -/
def specSentenceValid (years yen : Nat) (imprisoned fined : Bool) : Bool :=
  decide ((imprisoned = true → specWithinImprisonment years = true) ∧
          (fined = true → specWithinFine yen = true) ∧
          (imprisoned = true ∨ fined = true))

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specImprisonmentCeiling = 3 := by decide
example : specFineCeiling = 500_000 := by decide
example : specWithinImprisonment 0 = true := by decide
example : specWithinImprisonment 3 = true := by decide
example : specWithinImprisonment 4 = false := by decide
example : specWithinFine 499_999 = true := by decide
example : specWithinFine 500_000 = true := by decide
example : specWithinFine 500_001 = false := by decide
example : specSentenceValid 3 500_000 true true = true := by decide
example : specSentenceValid 4 500_001 true true = false := by decide
example : specSentenceValid 0 0 false false = false := by decide

/-- Universal kernel-checked bridge for the 年 ceiling. `omega` converts
    `¬ years > 3` into `years <= 3`. -/
theorem specWithinImprisonment_prop (years : Nat) :
    (specWithinImprisonment years = true) ↔ years <= imprisonmentCeilingYears := by
  unfold specWithinImprisonment specImprisonmentCeiling imprisonmentCeilingYears
  by_cases h : years <= 3
  · have h' : ¬ years > 3 := by omega
    simp [h, h']
  · have h' : years > 3 := by omega
    simp [h, h']

/-- Universal kernel-checked bridge for the 円 ceiling. -/
theorem specWithinFine_prop (yen : Nat) :
    (specWithinFine yen = true) ↔ yen <= fineCeilingYen := by
  unfold specWithinFine specFineCeiling fineCeilingYen
  by_cases h : yen <= 500_000
  · have h' : ¬ yen > 500_000 := by omega
    simp [h, h']
  · have h' : yen > 500_000 := by omega
    simp [h, h']

/-- Sole top-level impl/spec bridge: universal over years, yen and both flags.
    The iff lemmas rewrite the spec's `¬ >` formulas into the impl's `<=`
    formulas; `simp` then closes by reflexivity. Kernel-checked, axiom-free. -/
theorem agreeSentence (years yen : Nat) (imprisoned fined : Bool) :
    validSentence years yen imprisoned fined = specSentenceValid years yen imprisoned fined := by
  unfold validSentence specSentenceValid
  simp [specWithinImprisonment_prop, specWithinFine_prop]

end JapanTaxLaw.TonTaxPunishment
