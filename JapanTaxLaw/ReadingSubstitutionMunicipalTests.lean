import JapanTaxLaw.ReadingSubstitutionMunicipalSpec

/-
# ReadingSubstitutionMunicipalTests — kernel-checked checks for 第三条 読替え

All checks are `rfl` reductions of inductive values; no `by decide` is needed
for an enumerated type. Structural, non-numeric norm: no numerals appear.
-/

namespace JapanTaxLaw.ReadingSubstitutionMunicipal

open Phrase
open SpecPhrase

-- readingSubstitute: each constructor
example : readingSubstitute cityOrWardOrGeneralWard = wardOrGeneralWard := rfl
example : readingSubstitute wardOrGeneralWard = wardOrGeneralWard := rfl
example : readingSubstitute other = other := rfl

-- idempotence: substituting twice equals substituting once
example : readingSubstitute (readingSubstitute cityOrWardOrGeneralWard) =
    readingSubstitute cityOrWardOrGeneralWard := rfl
example : readingSubstitute (readingSubstitute wardOrGeneralWard) =
    readingSubstitute wardOrGeneralWard := rfl
example : readingSubstitute (readingSubstitute other) = readingSubstitute other := rfl

-- agreement with the independent spec at each constructor
example : toSpec (readingSubstitute cityOrWardOrGeneralWard) =
    specSubstitute (toSpec cityOrWardOrGeneralWard) := rfl
example : toSpec (readingSubstitute wardOrGeneralWard) =
    specSubstitute (toSpec wardOrGeneralWard) := rfl
example : toSpec (readingSubstitute other) =
    specSubstitute (toSpec other) := rfl

end JapanTaxLaw.ReadingSubstitutionMunicipal
