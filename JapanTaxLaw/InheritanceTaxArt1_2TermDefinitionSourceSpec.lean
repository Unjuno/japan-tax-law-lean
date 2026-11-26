import JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource

/-!
# InheritanceTaxArt1_2TermDefinitionSourceSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY.
Art.1の2(1) DELEGATION 「この法律において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」.
Normative unit: NORM|5535e9d60fcc528b55dc71a8ebb602f33891361f92b80dab7ad53701dca864dd

The implementation is an inductive value; the spec states the selection as a
Prop equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: actual term definitions, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource

/-- Independent spec: term meanings come from the following items. -/
def SpecDefinitionSource (s : DefinitionSource) : Prop :=
  s = DefinitionSource.followingItems

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecDefinitionSource definitionSource := rfl

/-- An unspecified alternative does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecDefinitionSource DefinitionSource.other := by
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource
