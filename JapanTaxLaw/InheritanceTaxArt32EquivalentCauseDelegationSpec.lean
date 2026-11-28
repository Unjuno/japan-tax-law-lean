import JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation

/-!
# InheritanceTaxArt32EquivalentCauseDelegationSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY.
Art.32(1) item6 DELEGATION 「前各号に規定する事由に準ずるものとして政令で定める事由が生じたこと。」.
Normative unit: NORM|82d24538082c811fd40812c245cec18adcb9be279741d0f8070dbf6c3497523b

The implementation uses a Bool conjunction; the spec states the same gate as a
Prop conjunction of two equalities, representationally distinct. Agreement is
proved by cases in the kernel. Axiom-free; no decide/simp/propext.

Not modelled: cabinet-order content, preceding items' content, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation

/-- Independent spec: both gates hold as Props. -/
def SpecInScope (a b : Bool) : Prop :=
  a = true ∧ b = true

/-- The implementation agrees with the spec. -/
theorem spec_agreement (a b : Bool) : inScope a b = true ↔ SpecInScope a b := by
  cases a with
  | false =>
      constructor
      · intro h; cases h
      · intro h; cases h with | intro ha hb => cases ha
  | true =>
      cases b with
      | false =>
          constructor
          · intro h; cases h
          · intro h; cases h with | intro ha hb => cases hb
      | true =>
          constructor
          · intro h; exact ⟨rfl, rfl⟩
          · intro h; rfl

end JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation
