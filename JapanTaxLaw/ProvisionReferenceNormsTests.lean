import JapanTaxLaw.ProvisionReferenceNorms
import JapanTaxLaw.ProvisionReferenceNormsSpec

/-!
# ProvisionReferenceNormsTests — 規定参照
-/
namespace JapanTaxLaw.ProvisionReferenceNormsTests
open JapanTaxLaw.ProvisionReferenceNorms

theorem resolve_spec (r : Resolver) (k : Nat) : resolve r k = JapanTaxLaw.ProvisionReferenceNormsSpec.resolveSpec r k := by rfl
theorem ram_spec (r : Resolver) (am : AmendmentMap) (k : Nat) : resolveAfterAmendment r am k = JapanTaxLaw.ProvisionReferenceNormsSpec.resolveAfterAmendmentSpec r am k := by rfl
example (r : Resolver) (k : Nat) (a b : ProvisionId) (ha : a = r k) (hb : b = r k) : a = b := resolve_deterministic r k a b ha hb
example (r : Resolver) (k : Nat) : resolve r k = resolve r k := same_ref_same_target r k
example (r : Resolver) (k1 k2 : Nat) (h : k1 = k2) : resolve r k1 = resolve r k2 := equal_keys_equal_targets r k1 k2 h
example (r : Resolver) (am : AmendmentMap) (k : Nat) : resolveAfterAmendment r am k = am (r k) := amendment_composes r am k
example (r : Resolver) (k : Nat) : resolveAfterAmendment r identityAmendment k = resolve r k := identity_amendment_preserves r k
example : provisionRefDeclared = true := provision_ref_is_declaration

end JapanTaxLaw.ProvisionReferenceNormsTests
