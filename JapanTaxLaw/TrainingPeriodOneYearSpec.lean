import JapanTaxLaw.TrainingPeriodOneYear

/-
# TrainingPeriodOneYearSpec — independent spec for 地価税法施行規則 art.3(6)(1)（一年以上）

Pinned source:
  Law id: 403M50000040031
  Revision: 403M50000040031_20260401_508M60000040010
  Snapshot: data/raw/403M50000040031_20260401_508M60000040010.law.json
  Statutory article: 第三条(6)(1) — 修業期間が一年以上
  原文逐語: 「修業期間が一年以上であること。」
  Normative unit: NORM|f419b346978e27bf42b959afb590a4b25283346677b360f6c0c6e56d429b8c8f

The implementation states 以上 with the inclusive operator `floor <= years`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ years < specTrainingFloor)` — a different operator from `<=`. It
reuses NO implementation definition inside its own `spec*` defs; the universal
`agree_training_floor` theorem is the only bridge, and the kernel checks it for
every Nat year count.

This is a STRUCTURAL spec: the statutory numeral is 一 (1), which the literal
extractor treats as structural, so source correspondence is anchored by the
verbatim pinned needle rather than by a distinct kanji literal.

Not modelled: the qualification, 修業 definition, other items/paragraphs and
enforcement rules.
-/

namespace JapanTaxLaw.TrainingPeriodOneYear

/-- Spec-local statutory value: 一年 = 1 year. Independent of impl. -/
def specTrainingFloor : Nat := 1

/-- Independent formula: 以上 as `¬ years < floor`. Uses `<`, not `<=`. -/
def specMeetsTraining (years : Nat) : Bool :=
  decide (¬ years < specTrainingFloor)

/-- Universal, kernel-checked correspondence for every natural year count. -/
theorem agree_training_floor (years : Nat) :
    meetsTrainingPeriod years = specMeetsTraining years := by
  unfold meetsTrainingPeriod trainingFloorYears specMeetsTraining specTrainingFloor
  by_cases h : 1 <= years
  · have hn : ¬ years < 1 := by omega
    simp [h, hn]
  · have hn : years < 1 := by omega
    simp [h, hn]

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specTrainingFloor = 1 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specTrainingGrid : Bool :=
  let f := specTrainingFloor
  [0, 1, 2, 3].all fun years =>
    specMeetsTraining years == decide (f <= years)

example : specTrainingGrid = true := by decide

end JapanTaxLaw.TrainingPeriodOneYear
