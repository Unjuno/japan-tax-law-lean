import JapanTaxLaw.LocalTax154LoadOver8TonsSpec

/- Kernel-decided boundary checks for 「（９）　最大積載量が八トンを超えるもの」. -/
namespace JapanTaxLaw.LocalTax154LoadOver8Tons

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 7 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 8 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 9 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 7 = false := by decide  -- threshold_below
example : inScopeBool 8 = false := by decide  -- threshold_at
example : inScopeBool 9 = true := by decide  -- threshold_above
example : inScope 8 ↔ specInScope 8 := agree_scope 8
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax154LoadOver8Tons
