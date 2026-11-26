import JapanTaxLaw.LocalTax453FalseReportFine300kSpec

/- Kernel-decided boundary checks for 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、三十万円以下の罰金に処する。」. -/
namespace JapanTaxLaw.LocalTax453FalseReportFine300k

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 299999 := by unfold inScope threshold; decide  -- below_limit
example : inScope 300000 := by unfold inScope threshold; decide  -- limit_at (以内/以下 inclusive)
example : ¬ inScope 300001 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 299999 = true := by decide  -- bool
example : inScopeBool 300000 = true := by decide  -- bool
example : inScopeBool 300001 = false := by decide  -- bool
example : inScope 300000 ↔ specInScope 300000 := agree_scope 300000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax453FalseReportFine300k
