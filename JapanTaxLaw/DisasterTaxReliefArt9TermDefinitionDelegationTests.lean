import JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegationSpec

/-!
# DisasterTaxReliefArt9TermDefinitionDelegationTests — kernel-checked checks

Verifies DELEGATION 「前項において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」: term meanings prescribed by the listed items.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation

example : definitionSource = DefinitionSource.listedItems := source_is_listed_items
example : definitionSource ≠ DefinitionSource.other := source_not_other
example : SpecDefinitionSource definitionSource := implementation_satisfies_spec
example : ¬ SpecDefinitionSource DefinitionSource.other := other_not_satisfying

end JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation
