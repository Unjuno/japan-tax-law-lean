import JapanTaxLaw.InheritanceCivilCodeRelativeRefSpec

/-!
# InheritanceCivilCodeRelativeRefTests — kernel-checked checks for art.1_2(1) item 1

All checks are `rfl` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceCivilCodeRelativeRef

example : referenceLawNumber = 89 := rfl
example : referenceArticle = 877 := rfl
example : inDefinedTerm PersonKind.spouse = true := rfl
example : inDefinedTerm PersonKind.civilCode877Relative = true := rfl
example : inDefinedTerm PersonKind.other = false := rfl
example : specInDefinedTerm PersonKind.spouse = true := rfl
example : specInDefinedTerm PersonKind.other = false := rfl
example : inDefinedTerm PersonKind.spouse = specInDefinedTerm PersonKind.spouse :=
  agree_in_defined_term PersonKind.spouse
example : inDefinedTerm PersonKind.other = specInDefinedTerm PersonKind.other :=
  agree_in_defined_term PersonKind.other
example : inDefinedTerm PersonKind.spouse = true := spouse_in_term
example : inDefinedTerm PersonKind.civilCode877Relative = true := civil_relative_in_term
example : inDefinedTerm PersonKind.other = false := other_not_in_term
example : referenceLawNumber = 89 := reference_law_number
example : referenceArticle = 877 := reference_article

end JapanTaxLaw.InheritanceCivilCodeRelativeRef
