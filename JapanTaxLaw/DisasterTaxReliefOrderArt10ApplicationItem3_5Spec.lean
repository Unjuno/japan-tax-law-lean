import JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5

/-!
# DisasterTaxReliefOrderArt10ApplicationItem3_5Spec — independent spec

Law id: 322CO0000000268 (政令), revision from INVENTORY. Article 10(1) Item 2 — EFFECT
「法第三条第五項の規定の適用を受けようとする旨」. Normative unit: NORM|89782d86b1c41898c6684fa9644bde155cf5722491c2e2a5a743f27654b89cc5

The implementation uses coordinate constants and a Bool function. The spec states
them as one Prop conjunction, representationally distinct. Axiom-free by cases/rfl.

Not modelled: application procedure, other items, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5

/-- Independent spec: coordinates + required-item discrimination. -/
def SpecEffect (i : ApplicationItem) (a p : Nat) : Prop :=
  a = 3 ∧ p = 5 ∧ isRequiredItem i = true

/-- The implementation satisfies the spec for the listed item. Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecEffect ApplicationItem.actArt3Para5Intent refArticle refParagraph := by
  unfold SpecEffect refArticle refParagraph isRequiredItem
  exact And.intro rfl (And.intro rfl rfl)

end JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5
