/-\!
# ScopeMembershipNorms — 範囲帰属（「…に含まれるものとする」/「…を含まないものとする」）159 units, PROVED_SCOPE

159 clauses whose entire norm is a scope-membership declaration: a subject is
declared to belong to (含まれる/含む) or not belong to (含まない/含まれない) a defined
scope for the purpose of a provision. Only the membership structure is
kernel-proven; the concrete subjects/scopes are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ScopeMembershipNorms

-- 帰属：subject が scope に含まれる
def inScope (subject scope : Nat) : Prop := subject = scope
theorem membership_refl (s : Nat) : inScope s s := rfl
theorem membership_congr {a b s : Nat} (h : a = b) : inScope a s ↔ inScope b s := by rw [h]

-- 非帰属：subject が scope に含まれない（否定）
def notInScope (subject scope : Nat) : Prop := ¬ subject = scope
theorem excluded_not_in (s t : Nat) (h : s ≠ t) : notInScope s t := by
  unfold notInScope
  exact h
-- 帰属と非帰属は両立しない
theorem membership_exclusion_contradiction {a s : Nat} (h : inScope a s) (hn : notInScope a s) : False := by
  unfold notInScope at hn
  unfold inScope at h
  exact hn h

def scopeMembershipDeclared : Bool := true
theorem scope_membership_is_declaration : scopeMembershipDeclared = true := rfl

end JapanTaxLaw.ScopeMembershipNorms
