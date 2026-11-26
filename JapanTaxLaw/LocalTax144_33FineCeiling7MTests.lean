import JapanTaxLaw.LocalTax144_33FineCeiling7MSpec

/- Kernel-decided boundary checks for 「七百万円以下の罰金に処し」. -/
namespace JapanTaxLaw.LocalTax144_33FineCeiling7M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 6_999_999 := by unfold inScope threshold; decide  -- below_ceiling
example : inScope 7_000_000 := by unfold inScope threshold; decide  -- ceiling_at (以下 inclusive)
example : ¬ inScope 7_000_001 := by unfold inScope threshold; decide  -- above_ceiling
example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 6_999_999 = true := by decide  -- below_ceiling
example : inScopeBool 7_000_000 = true := by decide  -- ceiling_at
example : inScopeBool 7_000_001 = false := by decide  -- above_ceiling
example : inScope 7_000_000 ↔ specInScope 7_000_000 := agree_scope 7_000_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax144_33FineCeiling7M
