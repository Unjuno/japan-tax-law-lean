import JapanTaxLaw.LocalTax73_19FalseReportFineCeiling500kSpec

/- Kernel-decided boundary checks for 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」. -/
namespace JapanTaxLaw.LocalTax73_19FalseReportFineCeiling500k

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 499999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 500000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 500001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 499999 = true := by decide  -- bool
example : inScopeBool 500000 = true := by decide  -- bool
example : inScopeBool 500001 = false := by decide  -- bool
example : inScope 500000 ↔ specInScope 500000 := agree_scope 500000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax73_19FalseReportFineCeiling500k
