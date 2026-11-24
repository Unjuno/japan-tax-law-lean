import JapanTaxLaw.MattersEnumerationNorms
import JapanTaxLaw.MattersEnumerationNormsSpec

/-!
# MattersEnumerationNormsTests — 事項の列挙
-/
namespace JapanTaxLaw.MattersEnumerationNormsTests
open JapanTaxLaw.MattersEnumerationNorms

theorem complete_spec (f : MatterList) : complete f = JapanTaxLaw.MattersEnumerationNormsSpec.completeSpec f := by rfl
theorem combine_spec (a b : MatterList) : combineMatters a b = JapanTaxLaw.MattersEnumerationNormsSpec.combineMattersSpec a b := by rfl
theorem add_spec (f : MatterList) (b : Bool) : addMatter f b = JapanTaxLaw.MattersEnumerationNormsSpec.addMatterSpec f b := by rfl
example : complete [] = true := empty_complete
example : complete [true, true] = true := all_filled
example : complete [true, false] = false := one_missing
example (a b : MatterList) (ha : complete a = true) (hb : complete b = true) : complete (combineMatters a b) = true := combine_complete a b ha hb
example (f : MatterList) (h : complete f = true) : complete (addMatter f false) = false := add_unfilled_incomplete f h
example : mattersEnumDeclared = true := matters_enum_is_declaration

end JapanTaxLaw.MattersEnumerationNormsTests
