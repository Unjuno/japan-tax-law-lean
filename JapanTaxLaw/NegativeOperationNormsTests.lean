import JapanTaxLaw.NegativeOperationNorms
import JapanTaxLaw.NegativeOperationNormsSpec

/-!
# NegativeOperationNormsTests — 否定操作
-/
namespace JapanTaxLaw.NegativeOperationNormsTests
open JapanTaxLaw.NegativeOperationNorms

theorem pos_spec (p : Bool) : positiveOp p = JapanTaxLaw.NegativeOperationNormsSpec.positiveOpSpec p := by rfl
theorem neg_spec (p : Bool) : negativeOp p = JapanTaxLaw.NegativeOperationNormsSpec.negativeOpSpec p := by rfl
theorem all_spec (a b : Bool) : allNegative a b = JapanTaxLaw.NegativeOperationNormsSpec.allNegativeSpec a b := by rfl
example : negativeOp false = true := negative_when_absent
example : negativeOp true = false := negative_fails_when_present
example (p : Bool) : negativeOp (negativeOp p) = positiveOp p := double_negation p
example (p : Bool) : ¬ (positiveOp p = true ∧ negativeOp p = true) := pos_neg_exclusive p
example : allNegative true true = true := all_both
example : allNegative true false = false := all_one_positive
example (p : Bool) (h : negativeOp p = true) : positiveOp p = false := negative_excludes_positive p h
example : negativeOperationDeclared = true := negative_operation_is_declaration

end JapanTaxLaw.NegativeOperationNormsTests
