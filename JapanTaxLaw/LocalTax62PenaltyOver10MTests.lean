import JapanTaxLaw.LocalTax62PenaltyOver10MSpec

/- Kernel-decided boundary checks for 「前項の免れた税額が千万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、千万円を超える額でその免れた税額に相当する額以下の額とすることができる。」. -/
namespace JapanTaxLaw.LocalTax62PenaltyOver10M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 9999999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 10000000 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 10000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 9999999 = false := by decide  -- bool
example : inScopeBool 10000000 = false := by decide  -- bool
example : inScopeBool 10000001 = true := by decide  -- bool
example : inScope 10000000 ↔ specInScope 10000000 := agree_scope 10000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax62PenaltyOver10M
