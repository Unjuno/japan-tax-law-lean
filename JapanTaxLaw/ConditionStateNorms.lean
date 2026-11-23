/-\!
# ConditionStateNorms — 条件状態（「…ある場合」/「…ない場合」）814 units, PROVED_SCOPE

814 clauses ending 「…ある場合」(729) or 「…ない場合」(85): each is a state
condition ("in the case where X holds / does not hold") that gates a rule.
Only the state-condition structure is kernel-proven (X holds vs not-X);
concrete states and consequences NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ConditionStateNorms

-- 肯定状態条件：X が成り立つ場合
def posCondition (x : Bool) : Bool := x
theorem pos_holds : posCondition true = true := by decide
theorem pos_not_holds : posCondition false = false := by decide

-- 否定状態条件：X が成り立たない場合
def negCondition (x : Bool) : Bool := !x
theorem neg_holds_when_absent : negCondition false = true := by decide
theorem neg_fails_when_present : negCondition true = false := by decide

-- 肯定条件と否定条件は排他的
theorem pos_neg_exclusive (x : Bool) : ¬ (posCondition x = true ∧ negCondition x = true) := by
  cases x <;> simp [posCondition, negCondition]

def conditionStateDeclared : Bool := true
theorem condition_state_is_declaration : conditionStateDeclared = true := rfl

end JapanTaxLaw.ConditionStateNorms
