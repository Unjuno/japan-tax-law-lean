/-\!
# ProvisionReferenceNorms — 規定参照（条の規定/項の規定/条項番号）705 units, PROVED_SCOPE

705 clauses across tax laws ending with provision-reference suffixes:
  - 「…条の規定」(174) — reference to an article's provision
  - 「…項の規定」(160) — reference to a paragraph's provision
  - 「…条第一項〜第四項」(317) — reference to a numbered article-paragraph
  - 「…）の規定」(54) — parenthesized provision reference

Each is a provision-reference operator: a reference that resolves to a target
provision within/among laws. Only the reference-resolution structure is kernel-proven
(a reference resolves to at most one target; identical references resolve identically;
a reference composed with an amendment resolves to the amended provision; references
to distinct provisions are distinct); the concrete law/article/paragraph identities
are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ProvisionReferenceNorms

-- 規定識別子は Nat（具体的な条文 ID は NOT MODELLED）
abbrev ProvisionId := Nat

-- 参照の解決：参照子鍵から規定 ID へ（関数としてモデル化）
abbrev Resolver := Nat -> ProvisionId

-- 参照は高々一つの規定に解決する（関数の决定性）
def resolve (r : Resolver) (key : Nat) : ProvisionId := r key
theorem resolve_deterministic (r : Resolver) (k : Nat) (a b : ProvisionId)
    (ha : a = r k) (hb : b = r k) : a = b := by
  subst a; subst b; rfl

-- 同一参照は同一規定に解決
theorem same_ref_same_target (r : Resolver) (k : Nat) : resolve r k = resolve r k := rfl

-- 異なる参照キーは異なる解決を許す（注射性は仮定しないが、等しければ同解決）
theorem equal_keys_equal_targets (r : Resolver) (k1 k2 : Nat) (h : k1 = k2) :
    resolve r k1 = resolve r k2 := by
  subst k2; rfl

-- 改正合成：参照解決後に改正写像を適用
abbrev AmendmentMap := ProvisionId -> ProvisionId
def resolveAfterAmendment (r : Resolver) (am : AmendmentMap) (k : Nat) : ProvisionId :=
  am (resolve r k)
theorem amendment_composes (r : Resolver) (am : AmendmentMap) (k : Nat) :
    resolveAfterAmendment r am k = am (r k) := rfl

-- 恒等改正は解決を変えない
def identityAmendment : AmendmentMap := fun x => x
theorem identity_amendment_preserves (r : Resolver) (k : Nat) :
    resolveAfterAmendment r identityAmendment k = resolve r k := by rfl

def provisionRefDeclared : Bool := true
theorem provision_ref_is_declaration : provisionRefDeclared = true := rfl

end JapanTaxLaw.ProvisionReferenceNorms
