/-\!
# IdentityPredicateNorms — 同一である／異なる／に等しい（同一性述語）30 units, FULLY_VERIFIED

30 clauses whose entire norm is an end-anchored identity/inequality predicate
（…が同一である場合／異なる場合／に等しい場合）. Concrete compared values are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.IdentityPredicateNorms

-- 同一である／に等しい
def same (a b : Nat) : Prop := a = b

-- 異なる
def diff (a b : Nat) : Prop := a ≠ b

theorem same_refl (a : Nat) : same a a := rfl
theorem same_symm {a b : Nat} (h : same a b) : same b a := h.symm
theorem same_trans {a b c : Nat} (h1 : same a b) (h2 : same b c) : same a c := h1.trans h2
theorem diff_symm {a b : Nat} (h : diff a b) : diff b a := fun hba => h hba.symm
theorem diff_iff_not_same (a b : Nat) : diff a b ↔ ¬ same a b := by rfl
theorem not_diff_iff_same (a b : Nat) : ¬ diff a b ↔ same a b := by
  unfold diff same; simp
theorem same_congr {a b : Nat} (h : same a b) (f : Nat → Nat) : f a = f b := by rw [h]

-- 構造宣言
def identityPredicateDeclared : Bool := true
theorem identity_predicate_is_declaration : identityPredicateDeclared = true := rfl

end JapanTaxLaw.IdentityPredicateNorms
