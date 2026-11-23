/-\!
# TemporalConditionNorms — 時的条件（完了・該当・存在）836 units, PROVED_SCOPE

836 clauses across tax laws ending with past/completion/classification/existence
condition suffixes:
  - 「…した場合」(460) / 「…つた場合」(238 unique) — completion condition
  - 「…なかつた場合」(24) — non-completion condition
  - 「…該当する場合」(84) — applicability/classification condition
  - 「…あるとき」(30) — existence/occurrence condition

Each is a condition operator that gates a legal rule. Only the condition
structure is kernel-proven (the condition holds iff its underlying proposition
holds; non-completion is negation; completion and non-completion are exclusive);
the concrete propositions and consequences are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.TemporalConditionNorms

-- 完了条件：「…した場合」/「…つた場合」 — 命題が成り立つ場合
def completionCondition (p : Bool) : Bool := p
theorem completion_holds : completionCondition true = true := by decide
theorem completion_fails : completionCondition false = false := by decide

-- 未完了条件：「…なかつた場合」 — 命題が成り立たない場合
def nonCompletionCondition (p : Bool) : Bool := !p
theorem non_completion_when_absent : nonCompletionCondition false = true := by decide
theorem non_completion_fails_when_present : nonCompletionCondition true = false := by decide

-- 完了と未完了は排他的
theorem completion_noncompletion_exclusive (p : Bool) :
    ¬ (completionCondition p = true ∧ nonCompletionCondition p = true) := by
  cases p <;> simp [completionCondition, nonCompletionCondition]

-- 該当条件：「…該当する場合」 — 区分に該当する場合
def applicabilityCondition (p : Bool) : Bool := p
theorem applicability_holds : applicabilityCondition true = true := by decide
theorem applicability_fails : applicabilityCondition false = false := by decide

-- 存在条件：「…あるとき」 — 対象が存在するとき
def existenceCondition (p : Bool) : Bool := p
theorem existence_holds : existenceCondition true = true := by decide
theorem existence_fails : existenceCondition false = false := by decide

def temporalConditionDeclared : Bool := true
theorem temporal_condition_is_declaration : temporalConditionDeclared = true := rfl

end JapanTaxLaw.TemporalConditionNorms
