import JapanTaxLaw.CustomsTariffArt8PrevReading7_8_23

/-!
# CustomsTariffArt8PrevReading7_8_23Spec — independent spec for 関税定率法 第八条(28)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(28) — a 準用: the provisions of paragraphs 7, 8 and 23 are read
         into the case where the preceding paragraph (前項, para 27) investigation
         has begun.
Normative unit: NORM|0eddc7c518823f0a15df18f78b861199b1187a2ecf3bf037a5045417ca0e8cbe

The implementation is `appliesViaReading : InvestigationState -> Provision -> Prop`,
true iff the state is prevStarted (independent of which source provision). The
independent spec enumerates the three source provisions as a propositional relation:

  SpecApplies s p := (s = prevStarted ∧ p = para7) ∨
                     (s = prevStarted ∧ p = para8) ∨
                     (s = prevStarted ∧ p = para23)

Representationally distinct (explicit enumeration vs. ignoring p) yet extensionally
equivalent for all inputs (Provision has exactly three constructors). Axiom-free
by exhaustive cases with constructor/rfl/cases-h — no `decide`/`simp`/`propext`.

Not modelled: substantive content of paragraphs 7/8/23/27, the trigger's
establishment, other reading rules, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8PrevReading7_8_23

/-- Independent spec: 準用 as an explicit three-way pairwise-provision relation. -/
def SpecApplies (s : InvestigationState) (p : Provision) : Prop :=
  (s = InvestigationState.prevStarted ∧ p = Provision.para7) ∨
  (s = InvestigationState.prevStarted ∧ p = Provision.para8) ∨
  (s = InvestigationState.prevStarted ∧ p = Provision.para23)

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

end JapanTaxLaw.CustomsTariffArt8PrevReading7_8_23
