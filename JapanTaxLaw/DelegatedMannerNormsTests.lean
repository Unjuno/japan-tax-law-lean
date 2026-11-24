import JapanTaxLaw.DelegatedMannerNorms
import JapanTaxLaw.DelegatedMannerNormsSpec

/-!
# DelegatedMannerNormsTests — 委任された方法
-/
namespace JapanTaxLaw.DelegatedMannerNormsTests
open JapanTaxLaw.DelegatedMannerNorms

theorem apply_spec (m : Manner) (i : Nat) : applyDelegated m i = JapanTaxLaw.DelegatedMannerNormsSpec.applyDelegatedSpec m i := by rfl
theorem compose_spec (m1 m2 : Manner) : composeManner m1 m2 = JapanTaxLaw.DelegatedMannerNormsSpec.composeMannerSpec m1 m2 := by rfl
example (m : Manner) (i : Nat) : applyDelegated m i = m i := delegation_deterministic m i
example (m : Manner) (i a b : Nat) (ha : a = m i) (hb : b = m i) : a = b := same_manner_same_result m i a b ha hb
example (m : Manner) (i : Nat) : applyDelegated m i = applyDelegated m i := delegation_stable m i
example (m1 m2 : Manner) (i : Nat) : composeManner m1 m2 i = m2 (m1 i) := compose_applies_in_sequence m1 m2 i
example (i : Nat) : applyDelegated identityManner i = i := identity_manner_noop i
example : delegatedMannerDeclared = true := delegated_manner_is_declaration

end JapanTaxLaw.DelegatedMannerNormsTests
