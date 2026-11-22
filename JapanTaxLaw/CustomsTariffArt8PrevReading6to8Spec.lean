import JapanTaxLaw.CustomsTariffArt8PrevReading6to8

/-!
# CustomsTariffArt8PrevReading6to8Spec — independent spec for 関税定率法 第八条(14)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(14) — a 準用: the provisions of paragraphs 6 through 8 are read
         into the case where the preceding paragraph (前項, para 13) investigation
         has begun.
Normative unit: NORM|533e8fd979ea8c72174c0058f51b1b16fd737427b0e378f0dc295d0f0140ed08

The implementation is `appliesViaReading : InvestigationState -> Provision -> Prop`,
true iff the state is prevStarted (independent of which source provision). The
independent spec enumerates the three source provisions as a propositional
relation:

  SpecApplies s p := (s = prevStarted ∧ p = para6) ∨
                     (s = prevStarted ∧ p = para7) ∨
                     (s = prevStarted ∧ p = para8)

Representationally distinct (explicit pairwise enumeration vs ignoring p) yet
extensionally equivalent for all inputs (Provision has exactly three constructors).
Kernel checks axiom-free by exhaustive cases with constructor/rfl/contradiction —
no `decide`, no `simp`, no `propext`.

Not modelled: substantive content of paragraphs 6-8/13, the trigger's establishment,
other reading rules, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8PrevReading6to8

/-- Independent spec: 準用 as an explicit three-way pairwise-provision relation. -/
def SpecApplies (s : InvestigationState) (p : Provision) : Prop :=
  (s = InvestigationState.prevStarted ∧ p = Provision.para6) ∨
  (s = InvestigationState.prevStarted ∧ p = Provision.para7) ∨
  (s = InvestigationState.prevStarted ∧ p = Provision.para8)

/-- Universal agreement. Axiom-free by exhaustive cases. -/
theorem agree_applies_via_reading (s : InvestigationState) (p : Provision) :
    appliesViaReading s p ↔ SpecApplies s p := by
  cases s
  · cases p
    · constructor
      · intro _h
        unfold SpecApplies
        exact Or.inl ⟨rfl, rfl⟩
      · intro _h
        rfl
    · constructor
      · intro _h
        unfold SpecApplies
        exact Or.inr (Or.inl ⟨rfl, rfl⟩)
      · intro _h
        rfl
    · constructor
      · intro _h
        unfold SpecApplies
        exact Or.inr (Or.inr ⟨rfl, rfl⟩)
      · intro _h
        rfl
  · constructor
    · intro h
      unfold appliesViaReading at h
      cases h
    · intro h
      unfold appliesViaReading
      unfold SpecApplies at h
      rcases h with ⟨h1, _⟩ | ⟨h1, _⟩ | ⟨h1, _⟩ <;> cases h1

end JapanTaxLaw.CustomsTariffArt8PrevReading6to8
