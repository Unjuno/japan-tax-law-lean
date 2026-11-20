import JapanTaxLaw.InheritanceCivilCodeRelativeRef

/-!
# InheritanceCivilCodeRelativeRefSpec — independent spec for 相続税法 art.1_2(1) item 1

Law id: 325AC0000000073
Revision: 325AC0000000073_20260401_506AC0000000008
Statutory article: art.1_2(1) item 1 — 配偶者及び民法877条に規定する親族をいう
Normative unit: NORM|12e21a0a9f20bff1db674861bd44ab88a5ad29f22d750c0042c85775e51414cb

The implementation expresses membership as an equality disjunction
`p == spouse || p == civilCode877Relative`. The independent spec uses a
STRUCTURAL PATTERN MATCH (`spouse => true; civilCode877Relative => true;
other => false`), a genuinely different formulation that does not call the
implementation. The kernel proves agreement for ALL three inhabitants by
exhaustive case analysis (universal over the finite type, not a sample).

Reference-target identities and boundary membership are also proved.

Not modelled: the substantive 民法877 definition, other art.1_2 items, tax
consequences.
-/

namespace JapanTaxLaw.InheritanceCivilCodeRelativeRef

/-- Independent spec: structural pattern match (distinct from equality disjunction). -/
def specInDefinedTerm (p : PersonKind) : Bool :=
  match p with
  | PersonKind.spouse => true
  | PersonKind.civilCode877Relative => true
  | PersonKind.other => false

/-- Correspondence for all inhabitants. Universal, kernel-checked. -/
theorem agree_in_defined_term (p : PersonKind) :
    inDefinedTerm p = specInDefinedTerm p := by
  cases p <;> rfl

/-- Boundary: the spouse (stated directly in this law) is in the defined term. -/
theorem spouse_in_term : inDefinedTerm PersonKind.spouse = true := by rfl

/-- Boundary: the Civil-Code-877 relative (by reference) is in the defined term. -/
theorem civil_relative_in_term : inDefinedTerm PersonKind.civilCode877Relative = true := by rfl

/-- Boundary: a person outside both disjuncts is not in the defined term. -/
theorem other_not_in_term : inDefinedTerm PersonKind.other = false := by rfl

/-- Reference target identity: 明治二十九年法律第八十九号 -> law number 89. -/
theorem reference_law_number : referenceLawNumber = 89 := rfl

/-- Reference target identity: 民法第八百七十七条 -> article 877. -/
theorem reference_article : referenceArticle = 877 := rfl

end JapanTaxLaw.InheritanceCivilCodeRelativeRef
