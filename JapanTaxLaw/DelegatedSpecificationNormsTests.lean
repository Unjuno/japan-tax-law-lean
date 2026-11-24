import JapanTaxLaw.DelegatedSpecificationNorms
import JapanTaxLaw.DelegatedSpecificationNormsSpec

/-!
# DelegatedSpecificationNormsTests — 委任事項の特定
-/
namespace JapanTaxLaw.DelegatedSpecificationNormsTests
open JapanTaxLaw.DelegatedSpecificationNorms

theorem spec_as_spec (r : SpecResolver) (t : DelegateTerm) : specifiedAs r t = JapanTaxLaw.DelegatedSpecificationNormsSpec.specifiedAsSpec r t := by rfl
theorem equiv_spec (r : SpecResolver) (a b : DelegateTerm) : specEquiv r a b = JapanTaxLaw.DelegatedSpecificationNormsSpec.specEquivSpec r a b := by rfl
example (r : SpecResolver) (t : DelegateTerm) : specifiedAs r t = r t := spec_deterministic r t
example (r : SpecResolver) (t a b : Nat) (ha : a = r t) (hb : b = r t) : a = b := same_term_same_target r t a b ha hb
example (r : SpecResolver) (t : DelegateTerm) : specifiedAs r t = specifiedAs r t := spec_stable r t
example (r : SpecResolver) (a : DelegateTerm) : specEquiv r a a = true := spec_equiv_refl r a
example (r : SpecResolver) (a b : DelegateTerm) (h : specEquiv r a b = true) : specEquiv r b a = true := spec_equiv_symm r a b h
example : delegatedSpecDeclared = true := delegated_spec_is_declaration

end JapanTaxLaw.DelegatedSpecificationNormsTests
