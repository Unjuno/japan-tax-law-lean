import JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition

/-!
# InheritanceTaxArt67LocalSurchargeProhibitionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 67 EFFECT
「地方公共団体は、相続税又は贈与税の付加税を課することができない。」。 Normative unit: NORM|0b8a19d9bdded2a705b40e195fe00f80c0287dd8fbb3abfb0f1c51511ecde0ec

The implementation uses a Bool function; the spec states the prohibition as a Prop
conjunction/disjunction, representationally distinct. Axiom-free by rfl/cases.

Not modelled: penalties, enforcement, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition

/-- Independent spec: local entity surcharge on the two named taxes is prohibited. -/
def SpecProhibited (isLocal : Bool) (t : TaxKind) : Prop :=
  isLocal = true ∧ (t = TaxKind.inheritance ∨ t = TaxKind.gift)

/-- The local inheritance case satisfies the spec. -/
theorem spec_local_inheritance : SpecProhibited true TaxKind.inheritance := by
  exact And.intro rfl (Or.inl rfl)

/-- The implementation satisfies the spec at that case. -/
theorem implementation_satisfies_spec : SpecProhibited true TaxKind.inheritance := by
  unfold SpecProhibited
  exact And.intro rfl (Or.inl rfl)

/-- The non-local case does not satisfy the spec. -/
theorem non_local_not_satisfying : ¬ SpecProhibited false TaxKind.inheritance := by
  intro h
  cases h.1

end JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition
