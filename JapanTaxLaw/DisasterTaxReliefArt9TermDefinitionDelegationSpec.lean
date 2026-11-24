import JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation

/-!
# DisasterTaxReliefArt9TermDefinitionDelegationSpec — independent spec

Law id: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律), revision from INVENTORY.
Article 9(2) DELEGATION 「前項において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」.
Normative unit: NORM|200175613e1a4cd1c5e1d7911ce4f45bd97c4d71bebd705ed18c1f06db87cab1

The implementation uses an inductive value; the spec states the source as a Prop
equality, representationally distinct. Axiom-free by rfl.

Not modelled: item definitions, preceding paragraph substance, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation

/-- Independent spec: the definition source is the listed items. -/
def SpecDefinitionSource (s : DefinitionSource) : Prop :=
  s = DefinitionSource.listedItems

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecDefinitionSource definitionSource := rfl

/-- The 'other' source does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecDefinitionSource DefinitionSource.other := by
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation
