import JapanTaxLaw.ActionTimingTriggers
import JapanTaxLaw.ActionTimingTriggersSpec

/-!
# ActionTimingTriggersTests — 行為時機トリガー
-/
namespace JapanTaxLaw.ActionTimingTriggersTests
open JapanTaxLaw.ActionTimingTriggers

theorem timing_spec (p : Bool) : timingCondition p = JapanTaxLaw.ActionTimingTriggersSpec.timingConditionSpec p := by rfl
theorem nottiming_spec (p : Bool) : notTimingCondition p = JapanTaxLaw.ActionTimingTriggersSpec.notTimingConditionSpec p := by rfl
theorem any_spec (a b : Bool) : anyTiming a b = JapanTaxLaw.ActionTimingTriggersSpec.anyTimingSpec a b := by rfl
theorem implies_spec (p q : Bool) : timingImplies p q = JapanTaxLaw.ActionTimingTriggersSpec.timingImpliesSpec p q := by rfl
example : timingCondition true = true := timing_holds
example : timingCondition false = false := timing_fails
example : notTimingCondition false = true := not_timing_when_absent
example : notTimingCondition true = false := not_timing_fails_when_present
example (p : Bool) : ¬ (timingCondition p = true ∧ notTimingCondition p = true) := timing_nottiming_exclusive p
example : anyTiming true false = true := first_timing
example : anyTiming false true = true := second_timing
example : anyTiming false false = false := no_timing
example (p q : Bool) (h : p = true) (hi : timingImplies p q = true) : q = true := timing_implies_consequence p q h hi
example : actionTimingDeclared = true := action_timing_is_declaration

end JapanTaxLaw.ActionTimingTriggersTests
