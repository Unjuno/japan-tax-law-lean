import JapanTaxLaw.LocalTax51StandardRateCeiling2Spec

/- Kernel-decided boundary checks for 「標準税率を超える税率で課する場合においても、百分の二を超えることができない。」. -/
namespace JapanTaxLaw.LocalTax51StandardRateCeiling2

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero (below ceiling)
example : inScope 1 := by unfold inScope threshold; decide  -- small_input (below ceiling)
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (ceiling inclusive)
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_above (prohibited)
example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- threshold_at
example : inScopeBool 3 = false := by decide  -- threshold_above
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax51StandardRateCeiling2
