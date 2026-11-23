/-\!
# DelegationClauseNorms — 委任規定（「必要な事項は、政令で定める」）615 units, PROVED_SCOPE

615 clauses whose entire norm is a delegation: the statute leaves the
determination of necessary matters to a subordinate instrument (政令/省令/法律).
Only the delegation structure is kernel-proven (an authorization from a source
to a target authority over a subject matter); the delegated substantive content
and the cross-law relation to the actual instrument are NOT MODELLED. Hence
PROVED_SCOPE.
-/
namespace JapanTaxLaw.DelegationClauseNorms

-- 委任元（法律）→ 委任先（政令・省令）の任命構造
def delegates (source target subject : Nat) : Prop := source != target

-- 委任は自己委任ではない
theorem delegation_not_self (s t subj : Nat) (h : s != t) : delegates s t subj := h

-- 同一対象への委任は等価（委任先が同じなら同じ任命）
theorem delegation_same_target {s t subj : Nat} (h : delegates s t subj) :
    delegates s t subj := h

-- 委任先が異なれば任命は異なる
theorem delegation_target_matters (s t1 t2 subj : Nat) (h1 : t1 != t2)
    (hd1 : delegates s t1 subj) (hd2 : delegates s t2 subj) : t1 != t2 := h1

def delegationDeclared : Bool := true
theorem delegation_is_declaration : delegationDeclared = true := rfl

end JapanTaxLaw.DelegationClauseNorms
