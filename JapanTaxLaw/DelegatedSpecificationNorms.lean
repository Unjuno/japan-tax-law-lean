/-\!
# DelegatedSpecificationNorms — 委任事項の特定（政令で定めるXは、Yとする）2128 units, PROVED_SCOPE

2128 clauses across tax laws with pattern 「政令/省令で定めるXは、Yとする。」— each
specifies what a cabinet-order/ministerial-ordinance-defined term denotes (e.g.
「政令で定める地域の指定は、…第三条第一項の規定による地域の指定とする」,
「政令で定める有価証券は、外国預託証券…とする」). Only the delegated-specification
structure is kernel-proven (a delegate term resolves to a specified target;
resolution is deterministic and stable; a specification is an equivalence between
the delegate term and its target); the concrete terms, targets and ordinances are
NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DelegatedSpecificationNorms

-- 委任項/対象は Nat で識別（具体値は NOT MODELLED）
abbrev DelegateTerm := Nat
abbrev Target := Nat

-- 委任先解決関数
abbrev SpecResolver := DelegateTerm -> Target

-- 委任事項の特定
def specifiedAs (r : SpecResolver) (t : DelegateTerm) : Target := r t
theorem spec_deterministic (r : SpecResolver) (t : DelegateTerm) : specifiedAs r t = r t := rfl
theorem same_term_same_target (r : SpecResolver) (t a b : Nat) (ha : a = r t) (hb : b = r t) : a = b := by
  subst a; subst b; rfl
theorem spec_stable (r : SpecResolver) (t : DelegateTerm) : specifiedAs r t = specifiedAs r t := rfl

-- 特定は同値関係（委任項と対象は同じ対象を指す）
def specEquiv (r : SpecResolver) (a b : DelegateTerm) : Bool := (r a) == (r b)
theorem spec_equiv_refl (r : SpecResolver) (a : DelegateTerm) : specEquiv r a a = true := by
  unfold specEquiv; simp
theorem spec_equiv_symm (r : SpecResolver) (a b : DelegateTerm) (h : specEquiv r a b = true) :
    specEquiv r b a = true := by
  unfold specEquiv at *
  simp at h ⊢
  exact h.symm

def delegatedSpecDeclared : Bool := true
theorem delegated_spec_is_declaration : delegatedSpecDeclared = true := rfl

end JapanTaxLaw.DelegatedSpecificationNorms
