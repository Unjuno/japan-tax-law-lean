import JapanTaxLaw.CustomsTariffArt8Reading7_8By22

/-!
# CustomsTariffArt8Reading7_8By22Spec — independent spec for 関税定率法 第八条(24)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(24) — a 準用: the provisions of paragraphs 7 and 8 are read into
         the case where the paragraph-22 investigation has begun.
Normative unit: NORM|9839bfa7e7f185855424800f3e4a5eb453f506c4c71e60153da993af1f76d0ba

The implementation is `appliesViaReading : InvestigationState -> Provision -> Prop`,
true iff the state is para22Started (independent of which source provision). The
independent spec enumerates the two source provisions as a propositional relation:

  SpecApplies s p := (s = para22Started ∧ p = para7) ∨
                     (s = para22Started ∧ p = para8)

Representationally distinct (pairwise enumeration vs. ignoring p) yet extensionally
equivalent for all inputs (Provision has exactly two constructors). Axiom-free by
exhaustive cases with constructor/rfl/cases-h — no `decide`/`simp`/`propext`.

Not modelled: substantive content of paragraphs 7/8/22, the trigger's establishment,
other reading rules, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8Reading7_8By22

/-- Independent spec: 準用 as a pairwise-provision propositional relation. -/
def SpecApplies (s : InvestigationState) (p : Provision) : Prop :=
  (s = InvestigationState.para22Started ∧ p = Provision.para7) ∨
  (s = InvestigationState.para22Started ∧ p = Provision.para8)

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
        exact Or.inr ⟨rfl, rfl⟩
      · intro _h
        rfl
  · constructor
    · intro h
      unfold appliesViaReading at h
      cases h
    · intro h
      unfold appliesViaReading
      unfold SpecApplies at h
      rcases h with ⟨h1, _⟩ | ⟨h1, _⟩ <;> cases h1

end JapanTaxLaw.CustomsTariffArt8Reading7_8By22
