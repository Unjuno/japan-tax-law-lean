import JapanTaxLaw.TaxPenaltyTriggers
import JapanTaxLaw.TaxPenaltyTriggersSpec

/-!
# TaxPenaltyTriggersTests — 租税罰則の発動要件
-/
namespace JapanTaxLaw.TaxPenaltyTriggersTests
open JapanTaxLaw.TaxPenaltyTriggers

theorem obstruction_spec (a b c : Bool) : inspectionObstruction a b c = JapanTaxLaw.TaxPenaltyTriggersSpec.inspectionObstructionSpec a b c := by rfl
theorem answer_spec (a b : Bool) : falseAnswer a b = JapanTaxLaw.TaxPenaltyTriggersSpec.falseAnswerSpec a b := by rfl
theorem books_spec (a b c d : Bool) : booksViolation a b c d = JapanTaxLaw.TaxPenaltyTriggersSpec.booksViolationSpec a b c d := by rfl
theorem penalty_spec (a b c d : Bool) : penaltyApplies a b c d = JapanTaxLaw.TaxPenaltyTriggersSpec.penaltyAppliesSpec a b c d := by rfl
example : inspectionObstruction true false false = true := refusal_triggers
example : inspectionObstruction false true false = true := obstruction_triggers
example : inspectionObstruction false false true = true := evasion_triggers
example : inspectionObstruction false false false = false := no_act_no_trigger
example : falseAnswer true false = true := no_answer_triggers
example : falseAnswer false true = true := untrue_triggers
example : falseAnswer false false = false := honest_answer_no_trigger
example : booksViolation false false false true = true := concealment_triggers
example : booksViolation false false false false = false := no_violation_no_trigger
example (o a r b : Bool) (h : o = true) : penaltyApplies o a r b = true := any_trigger_appleis o a r b h
example : taxPenaltyTriggersDeclared = true := tax_penalty_triggers_is_declaration

end JapanTaxLaw.TaxPenaltyTriggersTests
