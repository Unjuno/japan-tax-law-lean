import JapanTaxLaw.LocalTax455FineCeiling1MSpec

/- Kernel-decided boundary checks for 「偽りその他不正の行為により軽自動車税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」. -/
namespace JapanTaxLaw.LocalTax455FineCeiling1M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 999999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 1000000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 1000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 999999 = true := by decide  -- bool
example : inScopeBool 1000000 = true := by decide  -- bool
example : inScopeBool 1000001 = false := by decide  -- bool
example : inScope 1000000 ↔ specInScope 1000000 := agree_scope 1000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax455FineCeiling1M
