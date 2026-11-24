import JapanTaxLaw.FieldEnumerationNorms
import JapanTaxLaw.FieldEnumerationNormsSpec

/-!
# FieldEnumerationNormsTests — 記載事項の列挙
-/
namespace JapanTaxLaw.FieldEnumerationNormsTests
open JapanTaxLaw.FieldEnumerationNorms

theorem complete_spec (f : Form) : complete f = JapanTaxLaw.FieldEnumerationNormsSpec.completeSpec f := by rfl
theorem combine_spec (a b : Form) : combineForms a b = JapanTaxLaw.FieldEnumerationNormsSpec.combineFormsSpec a b := by rfl
theorem add_spec (f : Form) (b : Bool) : addField f b = JapanTaxLaw.FieldEnumerationNormsSpec.addFieldSpec f b := by rfl
example : complete [] = true := empty_is_complete
example : complete [true, true, true] = true := all_filled_complete
example : complete [true, false, true] = false := one_missing_incomplete
example (f : Form) (h : false ∈ f) : complete f = false := missing_implies_incomplete f h
example (a b : Form) (ha : complete a = true) (hb : complete b = true) : complete (combineForms a b) = true := combine_complete a b ha hb
example (f : Form) (h : complete f = true) : complete (addField f true) = true := add_duplicate_filled f h
example : fieldEnumDeclared = true := field_enum_is_declaration

end JapanTaxLaw.FieldEnumerationNormsTests
