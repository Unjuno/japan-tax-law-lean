import JapanTaxLaw.DocumentCopyNorms
import JapanTaxLaw.DocumentCopyNormsSpec

/-!
# DocumentCopyNormsTests — 書類の写し
-/
namespace JapanTaxLaw.DocumentCopyNormsTests
open JapanTaxLaw.DocumentCopyNorms

theorem copy_spec (s m : Bool) : copyRequirement s m = JapanTaxLaw.DocumentCopyNormsSpec.copyRequirementSpec s m := by rfl
theorem copyof_spec (o : OriginalId) : copyOf o = JapanTaxLaw.DocumentCopyNormsSpec.copyOfSpec o := by rfl
theorem all_spec (a b : Bool) : allCopies a b = JapanTaxLaw.DocumentCopyNormsSpec.allCopiesSpec a b := by rfl
example : copyRequirement true true = true := copy_satisfied
example : copyRequirement false true = false := copy_fails_absent
example : copyRequirement true false = false := copy_fails_mismatch
example (s m : Bool) (h : copyRequirement s m = true) : s = true ∧ m = true := copy_needs_both s m h
example (o : OriginalId) : copyOf o = o := copy_of_identity o
example : allCopies true true = true := all_both
example : allCopies true false = false := all_one_missing
example : documentCopyDeclared = true := document_copy_is_declaration

end JapanTaxLaw.DocumentCopyNormsTests
