import JapanTaxLaw.DelegatedCategoryAndPublicationNorms
import JapanTaxLaw.DelegatedCategoryAndPublicationNormsSpec

/-!
# DelegatedCategoryAndPublicationNormsTests — 委任区分・告示
-/
namespace JapanTaxLaw.DelegatedCategoryAndPublicationNormsTests
open JapanTaxLaw.DelegatedCategoryAndPublicationNorms

theorem category_spec (s d : Nat) : delegatedCategory s d ↔ JapanTaxLaw.DelegatedCategoryAndPublicationNormsSpec.delegatedCategorySpec s d := by rfl
theorem publishes_spec (d p : Bool) : publishes d p = JapanTaxLaw.DelegatedCategoryAndPublicationNormsSpec.publishesSpec d p := by rfl
example (s d : Nat) (h : s != d) : delegatedCategory s d := category_delegated_to_distinct s d h
example {s d : Nat} (h : delegatedCategory s d) : s != d := category_not_self_delegated h
example : publishes true true = true := designation_is_published
example : publishes false false = false := no_designation_no_publication
example (d p : Bool) (h : publishes d p = true) : d = true := publication_implies_designation d p h
example : delegatedCategoryAndPublicationDeclared = true := delegated_category_and_publication_is_declaration

end JapanTaxLaw.DelegatedCategoryAndPublicationNormsTests
