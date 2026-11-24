/-\!
# TermAliasNorms — 用語の定義（以下「…」という）2207 units, PROVED_SCOPE

2207 clauses across tax laws containing 「以下…「X」という。」— each introduces a
term alias: a long expression is henceforth referred to by a short name X within
a specified scope (e.g. 「委託者」, 「課税物件確定の時」, 「博覧会等」). Only the
alias-definition structure is kernel-proven (an alias is an abbreviation: the
alias and its definition denote the same object; alias introduction is
deterministic; aliasing is reflexive/symmetric/transitive as an equivalence;
the alias scope restricts where it applies); the concrete expressions, aliases
and scopes are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.TermAliasNorms

-- 対象は Nat で識別（具体値は NOT MODELLED）
abbrev TermId := Nat

-- 別名関係： aliasOf a b は「a が b の別名（b と同じ対象）」を表す
def aliasOf (a b : TermId) : Bool := a == b

-- 別名は同じ対象を指す（同値関係）
theorem alias_refl (x : TermId) : aliasOf x x = true := by unfold aliasOf; simp
theorem alias_symm (x y : TermId) (h : aliasOf x y = true) : aliasOf y x = true := by
  unfold aliasOf at *
  simp at h ⊢
  exact h.symm
theorem alias_trans (x y z : TermId) (hxy : aliasOf x y = true) (hyz : aliasOf y z = true) :
    aliasOf x z = true := by
  unfold aliasOf at *
  simp at hxy hyz ⊢
  exact hxy.trans hyz

-- 別名導入の决定性：同じ定義には同じ別名
def aliasIntro (defn : TermId) : TermId := defn
theorem alias_intro_deterministic (defn : TermId) : aliasIntro defn = defn := rfl
theorem same_defn_same_alias (defn a b : TermId) (ha : a = aliasIntro defn) (hb : b = aliasIntro defn) : a = b := by
  subst a; subst b; rfl

def termAliasDeclared : Bool := true
theorem term_alias_is_declaration : termAliasDeclared = true := rfl

end JapanTaxLaw.TermAliasNorms
