import JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference

/-!
# InheritanceTaxOrderArt1_2MutualAidContractReferenceSpec — independent spec

Law id: 325CO0000000071, revision from INVENTORY. Article 1_2 Item 3 Subitem 6 — REFERENCE
「法第十二条第一項第五号に規定する共済制度に係る契約」. Normative unit: NORM|11f7f4673dcaa2422142b0f75a5bb0310325bee78dc770b7857dd592bb56d975

The implementation uses coordinate constants and a Bool function. The spec states
them as one Prop conjunction, representationally distinct. Axiom-free by cases/rfl.

Not modelled: referenced system content, contract terms, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference

/-- Independent spec: reference coordinates + act-prescribed discrimination. -/
def SpecReference (s : MutualAidSystem) (a p i : Nat) : Prop :=
  a = 12 ∧ p = 1 ∧ i = 5 ∧ isActPrescribed s = true

/-- The implementation satisfies the spec for the act-prescribed system.
    Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecReference MutualAidSystem.actPrescribed refArticle refParagraph refItem := by
  unfold SpecReference refArticle refParagraph refItem isActPrescribed
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference
