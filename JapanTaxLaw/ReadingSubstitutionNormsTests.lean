import JapanTaxLaw.ReadingSubstitutionNorms
import JapanTaxLaw.ReadingSubstitutionNormsSpec

/-!
# ReadingSubstitutionNormsTests — 読替え演算子
-/
namespace JapanTaxLaw.ReadingSubstitutionNormsTests

open JapanTaxLaw.ReadingSubstitutionNorms

theorem spec_agreement (xs : List Nat) (o n : Nat) :
    readAs xs o n = JapanTaxLaw.ReadingSubstitutionNormsSpec.substituteSpec xs o n := by
  induction xs with
  | nil => rfl
  | cons x rest ih =>
      dsimp [readAs, JapanTaxLaw.ReadingSubstitutionNormsSpec.substituteSpec] at ih ⊢
      simp [ih]

example (o n : Nat) : readAs [] o n = [] := readAs_nil o n
example (xs : List Nat) (o : Nat) : readAs xs o o = xs := readAs_same xs o
example (x o n : Nat) : readAs [x] o n = [if x = o then n else x] := readAs_replaces x o n
example (xs : List Nat) (o n : Nat) : (readAs xs o n).length = xs.length := readAs_length xs o n
example : readingDeclared = true := reading_is_declaration

end JapanTaxLaw.ReadingSubstitutionNormsTests
