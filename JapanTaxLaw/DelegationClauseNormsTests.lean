import JapanTaxLaw.DelegationClauseNorms
import JapanTaxLaw.DelegationClauseNormsSpec

/-!
# DelegationClauseNormsTests — 委任規定
-/
namespace JapanTaxLaw.DelegationClauseNormsTests
open JapanTaxLaw.DelegationClauseNorms

theorem delegates_spec (s t subj : Nat) :
    delegates s t subj ↔ JapanTaxLaw.DelegationClauseNormsSpec.delegatesSpec s t subj := by rfl
example (s t subj : Nat) (h : s != t) : delegates s t subj := delegation_not_self s t subj h
example {s t subj : Nat} (h : delegates s t subj) : delegates s t subj := delegation_same_target h
example (s t1 t2 subj : Nat) (h1 : t1 != t2) (hd1 : delegates s t1 subj) (hd2 : delegates s t2 subj) : t1 != t2 := delegation_target_matters s t1 t2 subj h1 hd1 hd2
example : delegationDeclared = true := delegation_is_declaration

end JapanTaxLaw.DelegationClauseNormsTests
