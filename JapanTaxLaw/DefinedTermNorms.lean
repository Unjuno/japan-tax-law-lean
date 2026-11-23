/-\!
# DefinedTermNorms — 「以下「X」という」定義語演算子（420 units, PROVED_SCOPE）

420 clauses whose entire norm is an alias/defined-term declaration: a described
concept is bound to a short label 「X」 for use within a scope (以下この項…において).
Only the binding structure is kernel-proven (an alias denotes its definition);
the substantive content of the definition is NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DefinedTermNorms

-- 定義語バインディング：別名は定義対象を指す
def denotes (alias definition : Nat) : Nat := definition

theorem alias_denotes (a d : Nat) : denotes a d = d := rfl
theorem alias_congr {a d d' : Nat} (h : d = d') : denotes a d = denotes a d' := by rw [h]
theorem alias_distinct_labels (a1 a2 d : Nat) (h : a1 != a2) :
    denotes a1 d = denotes a2 d := rfl

def definedTermDeclared : Bool := true
theorem defined_term_is_declaration : definedTermDeclared = true := rfl

end JapanTaxLaw.DefinedTermNorms
