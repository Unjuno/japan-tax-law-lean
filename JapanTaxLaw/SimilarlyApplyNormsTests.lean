import JapanTaxLaw.SimilarlyApplyNorms
import JapanTaxLaw.SimilarlyApplyNormsSpec

/-!
# SimilarlyApplyNormsTests — 同様とする
-/
namespace JapanTaxLaw.SimilarlyApplyNormsTests
open JapanTaxLaw.SimilarlyApplyNorms

theorem apply_spec (b e : Bool) : similarlyApply b e = JapanTaxLaw.SimilarlyApplyNormsSpec.similarlyApplySpec b e := by rfl
theorem extend_spec (a b c : Bool) : extendTwice a b c = JapanTaxLaw.SimilarlyApplyNormsSpec.extendTwiceSpec a b c := by rfl
example : similarlyApply true false = true := applies_to_base
example : similarlyApply false true = true := applies_to_extra
example : similarlyApply false false = false := no_case_no_apply
example (a b c : Bool) : extendTwice a b c = similarlyApply a (similarlyApply b c) := extension_associative a b c
example (base : Bool) : similarlyApply base false = base := empty_extension_noop base
example (base : Bool) : similarlyApply base base = base := redundant_extension base
example : similarlyApplyDeclared = true := similarly_apply_is_declaration

end JapanTaxLaw.SimilarlyApplyNormsTests
