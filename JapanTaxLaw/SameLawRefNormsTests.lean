import JapanTaxLaw.SameLawRefNorms
import JapanTaxLaw.SameLawRefNormsSpec

/-!
# SameLawRefNormsTests — 同法参照
-/
namespace JapanTaxLaw.SameLawRefNormsTests
open JapanTaxLaw.SameLawRefNorms

theorem samelaw_spec (r : LawResolver) (ref : Nat) : sameLaw r ref = JapanTaxLaw.SameLawRefNormsSpec.sameLawSpec r ref := by rfl
theorem chain_spec (r : LawResolver) (a b : Nat) : chainRef r a b = JapanTaxLaw.SameLawRefNormsSpec.chainRefSpec r a b := by rfl
example (r : LawResolver) (ref : LawId) : sameLaw r ref = r ref := samelaw_deterministic r ref
example (r : LawResolver) (ref a b : Nat) (ha : a = r ref) (hb : b = r ref) : a = b := same_ref_same_law r ref a b ha hb
example (r : LawResolver) (ref : Nat) : sameLaw r ref = sameLaw r ref := samelaw_stable r ref
example (r : LawResolver) (a b : Nat) : chainRef r a b = r (r a + b) := chain_is_resolution r a b
example : sameLawRefDeclared = true := samelaw_ref_is_declaration

end JapanTaxLaw.SameLawRefNormsTests
