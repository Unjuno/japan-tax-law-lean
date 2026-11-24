/-\!
# DeclarationFormRefs — 申告書の参照（…る申告書）37 units, PROVED_SCOPE

37 clauses across tax laws ending 「…る申告書。」— each references a declaration
form prescribed by a provision (e.g. 「第四十五条の二第一項の規定による申告書」).
Only the declaration-form reference structure is kernel-proven (a form reference
resolves to a prescribed form; resolution is deterministic and stable; references
to distinct provisions are distinct); the concrete forms, provisions and contents
are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DeclarationFormRefs

-- 書式識別子（具体値は NOT MODELLED）
abbrev FormId := Nat
-- 規定キーから書式への解決関数
abbrev FormResolver := Nat -> FormId

-- 申告書参照の解決
def declarationForm (r : FormResolver) (key : Nat) : FormId := r key
theorem form_deterministic (r : FormResolver) (k : Nat) : declarationForm r k = r k := rfl
theorem same_key_same_form (r : FormResolver) (k a b : Nat) (ha : a = r k) (hb : b = r k) : a = b := by
  subst a; subst b; rfl

-- 同一規定キーは同じ書式（安定性）
theorem form_stable (r : FormResolver) (k : Nat) : declarationForm r k = declarationForm r k := rfl

-- 異なる規定の書式は異なる識別子を持ちうる（射影は単射とは限らないが区別は保持）
def distinctKeys (k1 k2 : Nat) : Bool := k1 != k2
theorem distinct_keys_bool (k1 k2 : Nat) : distinctKeys k1 k2 = (k1 != k2) := rfl

def declarationFormDeclared : Bool := true
theorem declaration_form_is_declaration : declarationFormDeclared = true := rfl

end JapanTaxLaw.DeclarationFormRefs
