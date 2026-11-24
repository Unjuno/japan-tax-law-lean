import JapanTaxLaw.DocumentRequirementNorms
import JapanTaxLaw.DocumentRequirementNormsSpec

/-!
# DocumentRequirementNormsTests — 書類要件
-/
namespace JapanTaxLaw.DocumentRequirementNormsTests
open JapanTaxLaw.DocumentRequirementNorms

theorem doc_spec (p c : Bool) : docRequirement p c = JapanTaxLaw.DocumentRequirementNormsSpec.docRequirementSpec p c := by rfl
theorem submission_spec (s : Bool) : submissionFulfilled s = JapanTaxLaw.DocumentRequirementNormsSpec.submissionFulfilledSpec s := by rfl
theorem all_spec (a b : Bool) : allRequirements a b = JapanTaxLaw.DocumentRequirementNormsSpec.allRequirementsSpec a b := by rfl
theorem implies_spec (a b : Bool) : requirementImplies a b = JapanTaxLaw.DocumentRequirementNormsSpec.requirementImpliesSpec a b := by rfl
example : docRequirement true true = true := requirement_satisfied
example : docRequirement false true = false := requirement_fails_absent
example : docRequirement true false = false := requirement_fails_incomplete
example (p c : Bool) (h : docRequirement p c = true) : p = true ∧ c = true := requirement_needs_both p c h
example : submissionFulfilled true = true := submission_done
example : submissionFulfilled false = false := submission_pending
example : allRequirements true true = true := all_both
example : allRequirements true false = false := all_one_missing
example (a b : Bool) (ha : a = true) (hi : requirementImplies a b = true) : b = true := implies_carries a b ha hi
example : documentRequirementDeclared = true := document_requirement_is_declaration

end JapanTaxLaw.DocumentRequirementNormsTests
