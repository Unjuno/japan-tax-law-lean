/-\!
# ApplyRefConditionNorms — 適用条件（「規定の適用を受ける場合」）157 units, PROVED_SCOPE

157 clauses whose entire norm is a provision-application condition: a rule is
triggered when a specified provision's application is invoked (規定の適用を
受ける場合/受ける者/受けるとき). Only the reference-condition structure is
kernel-proven; the concrete provision and consequence are NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ApplyRefConditionNorms

-- 適用条件：参照規定が適用されるなら条件成立
def applies (provisionApplied : Bool) : Bool := provisionApplied
theorem applied_satisfies : applies true = true := by decide
theorem not_applied_no_trigger : applies false = false := by decide

-- 適用条件は参照規定の適用を前提とする
theorem trigger_implies_applied (p : Bool) (h : applies p = true) : p = true := by
  cases p <;> simp [applies] at h ⊢

def applyRefConditionDeclared : Bool := true
theorem apply_ref_condition_is_declaration : applyRefConditionDeclared = true := rfl

end JapanTaxLaw.ApplyRefConditionNorms
