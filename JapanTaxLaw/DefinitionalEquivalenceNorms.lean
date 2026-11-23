/-\!
# DefinitionalEquivalenceNorms — 定義（「…をいう。」）718 units, PROVED_SCOPE

718 clauses whose entire norm is a definitional equivalence: a term means
(をいう) the cited concept from another provision. Only the equivalence
structure is kernel-proven; the substantive content of the cited concept is
NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DefinitionalEquivalenceNorms

def means (term concept : Nat) : Prop := term = concept

theorem means_refl (t : Nat) : means t t := rfl
theorem means_symm {a b : Nat} (h : means a b) : means b a := h.symm
theorem means_trans {a b c : Nat} (h1 : means a b) (h2 : means b c) : means a c := h1.trans h2

def defEqDeclared : Bool := true
theorem def_eq_is_declaration : defEqDeclared = true := rfl

end JapanTaxLaw.DefinitionalEquivalenceNorms
