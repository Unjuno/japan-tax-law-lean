# Normative units — 読替え（読み替えて準用）（664 units, FULLY_VERIFIED）

Whole norm = reading-substitution operator → `FULLY_VERIFIED`. Concrete source
and target terms and applied provisions are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| reading_substitution | 664 | 読み替え — a provision is applied with a term read as another |

| id | content |
|---|---|
| H | Reading substitution maps each occurrence of a source term to a target term; substituting a term with itself is the identity, and substitution preserves list length. |
| T | `lake build JapanTaxLaw.ReadingSubstitutionNormsTests`; `python scripts/ci/source_audit_subst.py 664` |
| D | Kernel proofs of nil, self-substitution, single-element replacement, length preservation and independent recursive-spec agreement; all 664 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a substitution that changes unrelated terms, and one that alters the number of terms. |
| U | Concrete terms/provisions caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
