import JapanTaxLaw.DeclarationFormRefs
import JapanTaxLaw.DeclarationFormRefsSpec

/-!
# DeclarationFormRefsTests — 申告書の参照
-/
namespace JapanTaxLaw.DeclarationFormRefsTests
open JapanTaxLaw.DeclarationFormRefs

theorem form_spec (r : FormResolver) (k : Nat) : declarationForm r k = JapanTaxLaw.DeclarationFormRefsSpec.declarationFormSpec r k := by rfl
theorem distinct_spec (a b : Nat) : distinctKeys a b = JapanTaxLaw.DeclarationFormRefsSpec.distinctKeysSpec a b := by rfl
example (r : FormResolver) (k : Nat) : declarationForm r k = r k := form_deterministic r k
example (r : FormResolver) (k a b : Nat) (ha : a = r k) (hb : b = r k) : a = b := same_key_same_form r k a b ha hb
example (r : FormResolver) (k : Nat) : declarationForm r k = declarationForm r k := form_stable r k
example (a b : Nat) : distinctKeys a b = (a != b) := distinct_keys_bool a b
example : declarationFormDeclared = true := declaration_form_is_declaration

end JapanTaxLaw.DeclarationFormRefsTests
