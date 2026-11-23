/-\!
# ConditionalTriggerNorms — 条件発生（「…たとき。」）363 units, PROVED_SCOPE

363 clauses ending 「…たとき。」across many tax laws: each is an occurrence
condition ("when X has happened") that triggers a legal consequence elsewhere.
Only the trigger-occurrence structure is kernel-proven (a condition holds when
its event has occurred); the concrete event and consequence are NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ConditionalTriggerNorms

-- 条件：事象が発生したとき成立
def triggered (occurred : Bool) : Bool := occurred
theorem occurrence_triggers : triggered true = true := by decide
theorem no_occurrence_no_trigger : triggered false = false := by decide

-- 条件は事象の発生を前提とする
theorem trigger_implies_occurred (o : Bool) (h : triggered o = true) : o = true := by
  cases o <;> simp [triggered] at h ⊢

-- 複数事象のいずれかで発動（論理和）
def anyTriggered (a b : Bool) : Bool := a || b
theorem first_triggers : anyTriggered true false = true := by decide
theorem second_triggers : anyTriggered false true = true := by decide
theorem neither_no_trigger : anyTriggered false false = false := by decide

def conditionalTriggerDeclared : Bool := true
theorem conditional_trigger_is_declaration : conditionalTriggerDeclared = true := rfl

end JapanTaxLaw.ConditionalTriggerNorms
