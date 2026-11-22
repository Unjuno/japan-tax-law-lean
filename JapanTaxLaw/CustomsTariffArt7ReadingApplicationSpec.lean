import JapanTaxLaw.CustomsTariffArt7ReadingApplication

/-!
# CustomsTariffArt7ReadingApplicationSpec — independent spec for 関税定率法 第七条(21)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第七条(21) — a 準用: the provisions of paragraphs 8 and 9 are read into
         the case where the paragraph-19 investigation has begun.
Normative unit: NORM|bfcac1c4b65905e68d25b72571e490792faac1b89d59528e53f37f99f733fd64

The implementation is a function `appliesViaReading : InvestigationState ->
Provision -> Prop` that is true iff the state is para19Started (independent of
which source provision). The independent spec states the same rule as a
PROPOSITIONAL relation that explicitly enumerates the two source provisions:

  SpecApplies s p := (s = para19Started ∧ p = Provision.para8) ∨
                     (s = para19Started ∧ p = Provision.para9)

This is representationally distinct (pairwise disjunction enumerating each
provision, rather than ignoring p) yet extensionally equivalent for all inputs
because Provision has exactly two constructors. Kernel checks are axiom-free by
exhaustive `cases` + constructor/`rfl`/`contradiction` — no `decide`, no `simp`/`propext`, no Classical.choice.

Not modelled: the substantive content of paragraphs 8/9/19, the trigger's
establishment, other reading rules, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7ReadingApplication

/-- Independent spec: 準用 stated as an explicit pairwise-provision relation. -/
def SpecApplies (s : InvestigationState) (p : Provision) : Prop :=
  (s = InvestigationState.para19Started ∧ p = Provision.para8) ∨
  (s = InvestigationState.para19Started ∧ p = Provision.para9)

/-- Universal agreement between implementation and independent spec.
    Axiom-free by exhaustive cases with constructor/rfl reasoning (no `decide`,
    no `simp`/`propext`). -/
theorem agree_applies_via_reading (s : InvestigationState) (p : Provision) :
    appliesViaReading s p ↔ SpecApplies s p := by
  cases s <;> cases p
  · constructor
    · intro _h
      unfold SpecApplies
      left
      constructor <;> rfl
    · intro _h
      rfl
  · constructor
    · intro _h
      unfold SpecApplies
      right
      constructor <;> rfl
    · intro _h
      rfl
  · constructor
    · intro h
      contradiction
    · intro h
      unfold SpecApplies at h
      rcases h with ⟨h1, _⟩ | ⟨h1, _⟩ <;> contradiction
  · constructor
    · intro h
      contradiction
    · intro h
      unfold SpecApplies at h
      rcases h with ⟨h1, _⟩ | ⟨h1, _⟩ <;> contradiction

end JapanTaxLaw.CustomsTariffArt7ReadingApplication
