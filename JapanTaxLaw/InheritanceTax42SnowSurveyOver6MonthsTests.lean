import JapanTaxLaw.InheritanceTax42SnowSurveyOver6MonthsSpec

/- Kernel-decided boundary checks for 「第二項の規定により、税務署長が、同項の調査を行う場合において、積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるときにおける前項の規定の適用については、同項中「六月」とあるのは、「九月」とする。」. -/
namespace JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 5 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 6 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 7 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 5 = false := by decide  -- bool
example : inScopeBool 6 = false := by decide  -- bool
example : inScopeBool 7 = true := by decide  -- bool
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months
