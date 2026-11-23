/-\!
# ActionTimingTriggers — 行為時機トリガー（「…るとき。」）194 units, PROVED_SCOPE

194 clauses across tax laws ending 「…るとき。」— each is an action-timing
condition: "when an authority/party is about to perform / performs action X,
rule Y applies" (e.g. 「決定をしようとするとき」, 「作成しようとするとき」).
Only the trigger structure is kernel-proven (the condition holds iff the timing
proposition holds; negation and disjunction of timing conditions behave classically);
the concrete actions and triggered consequences are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ActionTimingTriggers

-- 行為時機条件：行為をしようとするとき（命題が成り立つ場合）
def timingCondition (p : Bool) : Bool := p
theorem timing_holds : timingCondition true = true := by decide
theorem timing_fails : timingCondition false = false := by decide

-- 否定時機条件：行為をしようとしないとき
def notTimingCondition (p : Bool) : Bool := !p
theorem not_timing_when_absent : notTimingCondition false = true := by decide
theorem not_timing_fails_when_present : notTimingCondition true = false := by decide

-- 時機条件と否定時機条件は排他的
theorem timing_nottiming_exclusive (p : Bool) :
    ¬ (timingCondition p = true ∧ notTimingCondition p = true) := by
  cases p <;> simp [timingCondition, notTimingCondition]

-- 複数の時機条件のいずれか（ OR ）
def anyTiming (a b : Bool) : Bool := a || b
theorem first_timing : anyTiming true false = true := by decide
theorem second_timing : anyTiming false true = true := by decide
theorem no_timing : anyTiming false false = false := by decide

-- 含意：時機条件が成り立てば帰結が適用される（構造のみ）
def timingImplies (p q : Bool) : Bool := !p || q
theorem timing_implies_consequence (p q : Bool) (h : p = true) (himp : timingImplies p q = true) : q = true := by
  cases p <;> cases q <;> simp [timingImplies] at h himp ⊢

def actionTimingDeclared : Bool := true
theorem action_timing_is_declaration : actionTimingDeclared = true := rfl

end JapanTaxLaw.ActionTimingTriggers
