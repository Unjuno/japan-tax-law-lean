import JapanTaxLaw.IdentityPredicateNorms
import JapanTaxLaw.IdentityPredicateNormsSpec

/-!
# IdentityPredicateNormsTests — 同一性述語
-/
namespace JapanTaxLaw.IdentityPredicateNormsTests

open JapanTaxLaw.IdentityPredicateNorms

example : same 3 3 := same_refl 3
example {a b : Nat} (h : same a b) : same b a := same_symm h
example {a b c : Nat} (h1 : same a b) (h2 : same b c) : same a c := same_trans h1 h2
example {a b : Nat} (h : diff a b) : diff b a := diff_symm h
example (a b : Nat) : diff a b ↔ ¬ same a b := diff_iff_not_same a b
example (a b : Nat) : ¬ diff a b ↔ same a b := not_diff_iff_same a b
example {a b : Nat} (h : same a b) (f : Nat → Nat) : f a = f b := same_congr h f
example : identityPredicateDeclared = true := identity_predicate_is_declaration

end JapanTaxLaw.IdentityPredicateNormsTests
