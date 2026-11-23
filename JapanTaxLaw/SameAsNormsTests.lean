import JapanTaxLaw.SameAsNorms
import JapanTaxLaw.SameAsNormsSpec

/-!
# SameAsNormsTests — 「以下同じ。」参照スコープ
-/
namespace JapanTaxLaw.SameAsNormsTests
open JapanTaxLaw.SameAsNorms

theorem sameAs_spec (a b : Nat) : sameAs a b ↔ JapanTaxLaw.SameAsNormsSpec.sameAsSpec a b := by rfl
example (x : Nat) : sameAs x x := sameAs_refl x
example {a b : Nat} (h : sameAs a b) : sameAs b a := sameAs_symm h
example {a b c : Nat} (h1 : sameAs a b) (h2 : sameAs b c) : sameAs a c := sameAs_trans h1 h2
example : sameAsDeclared = true := same_as_is_declaration

end JapanTaxLaw.SameAsNormsTests
