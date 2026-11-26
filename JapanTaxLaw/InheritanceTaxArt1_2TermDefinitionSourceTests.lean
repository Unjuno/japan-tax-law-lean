import JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSourceSpec

/-!
# InheritanceTaxArt1_2TermDefinitionSourceTests — kernel-checked checks

Verifies DELEGATION 「この法律において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」: following-items source selected, other not.
-/

namespace JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource

example : definitionSource = DefinitionSource.followingItems := source_is_following_items
example : definitionSource ≠ DefinitionSource.other := other_not_selected
example : SpecDefinitionSource definitionSource := implementation_satisfies_spec
example : ¬ SpecDefinitionSource DefinitionSource.other := other_not_satisfying

end JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource
