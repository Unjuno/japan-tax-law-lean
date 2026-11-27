import JapanTaxLaw.InheritanceTax39SurveyOver3MonthsSpec

/- Kernel-decided boundary checks for 「第二項の規定により、税務署長が、同項の調査を行う場合において、当該調査に三月を超える期間を要すると認めるときにおける同項の規定の適用については、同項中「三月」とあるのは、「六月」とする。」. -/
namespace JapanTaxLaw.InheritanceTax39SurveyOver3Months

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 2 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 4 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = false := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScopeBool 4 = true := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax39SurveyOver3Months
