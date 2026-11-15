import JapanTaxLaw.Verdict
import JapanTaxLaw.VerdictLemmas
import JapanTaxLaw.CorpActor

/-!
# CorpActor specification — independent statement of Act art. 2 items 3 and 4

Independent statement of the Act art. 2 items 3/4 rule, derived from the
pinned official text. This module is written WITHOUT reference to the proofs
inside CorpActor.lean; it merely faithfully re-states the statutory
definition so consumers can check against any implementation.

Domestic corporation (art. 2 item 3):
  国内に本店又は主たる事務所を有する法人をいう。

Foreign corporation (art. 2 item 4):
  内国法人以外の法人をいう。
-/

namespace JapanTaxLaw

namespace CorpActorSpec

/-- Domestic corporation judgment: sufficient to classify as resident. -/
inductive DomesticCorpJudgment : CorpActorFacts → Prop where
  | headOfficeInJapan (f : CorpActorFacts) (h : f.headOfficeInJapan = Verdict.yes) :
      DomesticCorpJudgment f
  | mainOfficeInJapan (f : CorpActorFacts) (h : f.mainOfficeInJapan = Verdict.yes) :
      DomesticCorpJudgment f

/-- Every domestic judgment is witness-based and decidable. -/
theorem domestic_iff_either_office_yes {f : CorpActorFacts} :
    DomesticCorpJudgment f ↔ f.headOfficeInJapan = Verdict.yes ∨ f.mainOfficeInJapan = Verdict.yes := by
  constructor
  · intro h
    cases h with
    | headOfficeInJapan hh => exact Or.inl hh
    | mainOfficeInJapan hh => exact Or.inr hh
  · intro h
    cases h with
    | inl hh => exact DomesticCorpJudgment.headOfficeInJapan _ hh
    | inr hh => exact DomesticCorpJudgment.mainOfficeInJapan _ hh

/-- Foreign corporation judgment: sufficient to classify as foreign. -/
inductive ForeignCorpJudgment : CorpActorFacts → Prop where
  | bothOutsideJapan (f : CorpActorFacts)
      (h1 : f.headOfficeInJapan = Verdict.no) (h2 : f.mainOfficeInJapan = Verdict.no) :
      ForeignCorpJudgment f

/-- Foreign judgment iff both offices negated. -/
theorem foreign_iff_both_outside {f : CorpActorFacts} :
    ForeignCorpJudgment f ↔ f.headOfficeInJapan = Verdict.no ∧ f.mainOfficeInJapan = Verdict.no := by
  constructor
  · intro h
    cases h with
    | bothOutsideJapan h1 h2 => exact ⟨h1, h2⟩
  · intro ⟨h1, h2⟩
    exact ForeignCorpJudgment.bothOutsideJapan _ h1 h2

end CorpActorSpec

open CorpActorSpec

-- ==================== soundness: impl ⇒ spec, vice versa (complete) ====================

/-- Spec ⇒ impl: independently stated sufficient condition honoured by impl. -/
theorem actor_spec_sound (f : CorpActorFacts)
    (h : DomesticCorpJudgment f) : classifyCorpActor f = .resident := by
  cases h with
  | headOfficeInJapan hh =>
      cases hm : f.mainOfficeInJapan <;>
        simp [classifyCorpActor, classifyCorpVerdict, isDomesticCorpVerdict, Verdict.or, hh, hm]
  | mainOfficeInJapan hh =>
      cases hm : f.headOfficeInJapan <;>
        simp [classifyCorpActor, classifyCorpVerdict, isDomesticCorpVerdict, Verdict.or, hh, hm]

/-- Impl ⇒ spec: every resident output witnessed by a spec judgment. -/
theorem actor_spec_complete (f : CorpActorFacts)
    (h : classifyCorpActor f = .resident) : DomesticCorpJudgment f := by
  unfold classifyCorpActor classifyCorpVerdict at h
  cases hf : f.headOfficeInJapan <;> cases hm : f.mainOfficeInJapan <;>
    first
      | exact DomesticCorpJudgment.headOfficeInJapan f hf
      | exact DomesticCorpJudgment.mainOfficeInJapan f hm
      | simp [isDomesticCorpVerdict, Verdict.or, hf, hm] at h

/-- Foreign: spec ⇒ impl. -/
theorem actor_foreign_spec_sound (f : CorpActorFacts)
    (h : ForeignCorpJudgment f) : classifyCorpActor f = .foreign := by
  cases h with
  | bothOutsideJapan h1 h2 =>
      simp [classifyCorpActor, classifyCorpVerdict, isDomesticCorpVerdict, Verdict.or, h1, h2]

/-- Foreign: impl ⇒ spec. -/
theorem actor_foreign_spec_complete (f : CorpActorFacts)
    (h : classifyCorpActor f = .foreign) : ForeignCorpJudgment f := by
  unfold classifyCorpActor classifyCorpVerdict at h
  cases hf : f.headOfficeInJapan <;> cases hm : f.mainOfficeInJapan <;>
    first
      | exact ForeignCorpJudgment.bothOutsideJapan f hf hm
      | simp [isDomesticCorpVerdict, Verdict.or, hf, hm] at h

/-- Foreign conclusion forces both offices negated. -/
theorem foreign_judgment_negates_offices {f : CorpActorFacts}
    (h : classifyCorpActor f = .foreign) : f.headOfficeInJapan = Verdict.no ∧
    f.mainOfficeInJapan = Verdict.no := by
  have hdom : isDomesticCorpVerdict f = Verdict.no := foreign_implies_not_resident f h
  unfold isDomesticCorpVerdict at hdom
  rw [Verdict.or_eq_no] at hdom
  exact hdom

end JapanTaxLaw
