import JapanTaxLaw.LocalTax62EvadedOver5MSpec

/- Kernel-decided boundary checks for 「免れた税額が五百万円を超える場合には」. -/
namespace JapanTaxLaw.LocalTax62EvadedOver5M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 4_999_999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 5_000_000 := by unfold inScope threshold; decide  -- threshold_at (を超え strict)
example : inScope 5_000_001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 4_999_999 = false := by decide  -- threshold_below
example : inScopeBool 5_000_000 = false := by decide  -- threshold_at
example : inScopeBool 5_000_001 = true := by decide  -- threshold_above
example : inScope 5_000_000 ↔ specInScope 5_000_000 := agree_scope 5_000_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax62EvadedOver5M
