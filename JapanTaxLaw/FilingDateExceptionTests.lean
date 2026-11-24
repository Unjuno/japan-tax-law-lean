import JapanTaxLaw.FilingDateExceptionSpec

/-
# FilingDateExceptionTests — kernel-decided boundary checks

Pinned law 426CO0000000139 / revision 426CO0000000139_20260401_508CO0000000095,
Article 6 proviso: strict-before trigger, equality is the complementary main rule.
Boundary categories exercised: zero, small_input, saturation (definition
reduction at the equality boundary). No human legal review.
-/

namespace JapanTaxLaw.FilingDateException

-- Implementation facts, replayed as theorem-as-proof examples.
example : itemOneRef = 1 := item_one_ref_eq_one
example : isBeforeDeadline 9 10 = true := is_before_deadline_9_10
example : isBeforeDeadline 10 10 = false := is_before_deadline_10_10
example : isBeforeDeadline 11 10 = false := is_before_deadline_11_10
example : baseRuleApplies 9 10 = false := base_rule_applies_9_10
example : baseRuleApplies 10 10 = true := base_rule_applies_10_10
example : baseRuleApplies 11 10 = true := base_rule_applies_11_10

-- Independent spec grid, kernel-decided.
example : specItemRef = 1 := by decide
example : specBefore 9 10 = true := by decide
example : specBefore 10 10 = false := by decide
example : specBefore 11 10 = false := by decide
example : specBaseApplies 9 10 = false := by decide
example : specBaseApplies 10 10 = true := by decide
example : specBaseApplies 11 10 = true := by decide

-- Zero / one boundary (caller-established day indices).
example : isBeforeDeadline 0 0 = false := by decide
example : isBeforeDeadline 0 1 = true := by decide
example : isBeforeDeadline 1 0 = false := by decide
example : baseRuleApplies 0 0 = true := by decide
example : baseRuleApplies 0 1 = false := by decide
example : baseRuleApplies 1 0 = true := by decide

-- Definition reduction at the equality boundary (no off-by-one).
example : isBeforeDeadline 0 0 = decide (0 < 0) := by rfl
example : isBeforeDeadline 10 10 = decide (10 < 10) := by rfl
example : baseRuleApplies 10 10 = decide (10 <= 10) := by rfl

-- Implementation / spec agreement via the unfold + rfl bridges.
example : itemOneRef = specItemRef := agreeItemRef
example : isBeforeDeadline 9 10 = specBefore 9 10 := agreeBefore 9 10
example : isBeforeDeadline 10 10 = specBefore 10 10 := agreeBefore 10 10
example : isBeforeDeadline 11 10 = specBefore 11 10 := agreeBefore 11 10
example : baseRuleApplies 9 10 = specBaseApplies 9 10 := agreeBase 9 10
example : baseRuleApplies 10 10 = specBaseApplies 10 10 := agreeBase 10 10
example : baseRuleApplies 11 10 = specBaseApplies 11 10 := agreeBase 11 10

end JapanTaxLaw.FilingDateException
