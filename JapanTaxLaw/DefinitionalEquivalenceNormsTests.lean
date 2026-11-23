import JapanTaxLaw.DefinitionalEquivalenceNorms
import JapanTaxLaw.DefinitionalEquivalenceNormsSpec

/-!
# DefinitionalEquivalenceNormsTests — 定義等価
-/
namespace JapanTaxLaw.DefinitionalEquivalenceNormsTests
open JapanTaxLaw.DefinitionalEquivalenceNorms

theorem means_spec (a b : Nat) : means a b ↔ JapanTaxLaw.DefinitionalEquivalenceNormsSpec.meansSpec a b := by rfl
example (t : Nat) : means t t := means_refl t
example {a b : Nat} (h : means a b) : means b a := means_symm h
example {a b c : Nat} (h1 : means a b) (h2 : means b c) : means a c := means_trans h1 h2
example : defEqDeclared = true := def_eq_is_declaration

end JapanTaxLaw.DefinitionalEquivalenceNormsTests
