import JapanTaxLaw.InlineReadingSubstitutionNorms
import JapanTaxLaw.InlineReadingSubstitutionNormsSpec

/-!
# InlineReadingSubstitutionNormsTests — 読替え
-/
namespace JapanTaxLaw.InlineReadingSubstitutionNormsTests
open JapanTaxLaw.InlineReadingSubstitutionNorms

theorem readAs_spec (a b : Nat) : readAs a b = JapanTaxLaw.InlineReadingSubstitutionNormsSpec.readAsSpec a b := by rfl
example (a b : Nat) : readAs a b = b := reads_as_replacement a b
example (a : Nat) : readAs a a = a := readAs_self a
example {a b b' : Nat} (h : b = b') : readAs a b = readAs a b' := readAs_congr h
example (a b c : Nat) : readAs (readAs a b) c = c := readAs_twice a b c
example : inlineReadingSubstitutionDeclared = true := inline_reading_substitution_is_declaration

end JapanTaxLaw.InlineReadingSubstitutionNormsTests
