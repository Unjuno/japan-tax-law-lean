import JapanTaxLaw.CustomsTariffArt7PrevParagraphReading

/-!
# CustomsTariffArt7PrevParagraphReadingSpec — independent spec for 関税定率法 第七条(25)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第七条(25) — a 準用: the provisions of paragraphs 8, 9 and 20 are read
         into the case where the preceding paragraph (前項, para 24) investigation
         has begun.
Normative unit: NORM|f8c7e9bb416eb400df2c804473bd1982fd394436266d05baed397418ac7c731e

The implementation is a function `appliesViaReading : InvestigationState ->
Provision -> Prop` that is true iff the state is prevStarted (independent of
which source provision). The independent spec states the same rule as a
PROPOSITIONAL relation enumerating all three source provisions:

  SpecApplies s p := (s = prevStarted ∧ p = para8) ∨
                     (s = prevStarted ∧ p = para9) ∨
                     (s = prevStarted ∧ p = para20)

This is representationally distinct (explicit pairwise enumeration vs ignoring
p) yet extensionally equivalent for all inputs because Provision has exactly
three constructors. Kernel checks are axiom-free by exhaustive cases with
constructor/rfl/contradiction — no `decide`, no `simp`, no `propext`.

Not modelled: substantive content of paragraphs 8/9/20/24, the trigger's
establishment, other reading rules, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7PrevParagraphReading

/-- Independent spec: 準用 as an explicit three-way pairwise-provision relation. -/
def SpecApplies (s : InvestigationState) (p : Provision) : Prop :=
  (s = InvestigationState.prevStarted ∧ p = Provision.para8) ∨
  (s = InvestigationState.prevStarted ∧ p = Provision.para9) ∨
  (s = InvestigationState.prevStarted ∧ p = Provision.para20)

/-- Universal agreement between implementation and independent spec.
    Axiom-free by exhaustive cases with constructor/rfl/contradiction. -/
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

end JapanTaxLaw.CustomsTariffArt7PrevParagraphReading
