import JapanTaxLaw.InheritanceTax49DisclosureWithin2MonthsSpec

/- Kernel-decided boundary checks for 「第一項の請求があつた場合には、税務署長は、当該請求をした者に対し、当該請求後二月以内に同項の開示をしなければならない。」. -/
namespace JapanTaxLaw.InheritanceTax49DisclosureWithin2Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input / threshold_below
example : inScope 2 := by unfold inScope threshold; decide  -- limit_at (以内/以下 inclusive)
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool (threshold_below)
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax49DisclosureWithin2Months
