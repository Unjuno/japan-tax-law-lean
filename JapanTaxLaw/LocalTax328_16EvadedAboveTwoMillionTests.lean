import JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillionSpec

/- Kernel-decided boundary checks for 「第一項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」. -/
namespace JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 1999999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 2000000 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 2000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 1999999 = false := by decide  -- bool
example : inScopeBool 2000000 = false := by decide  -- bool
example : inScopeBool 2000001 = true := by decide  -- bool
example : inScope 2000000 ↔ specInScope 2000000 := agree_scope 2000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion
