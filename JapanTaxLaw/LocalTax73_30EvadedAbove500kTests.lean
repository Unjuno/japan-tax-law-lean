import JapanTaxLaw.LocalTax73_30EvadedAbove500kSpec

/- Kernel-decided boundary checks for 「前項の免れた税額が五十万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五十万円を超える額でその免れた税額に相当する額以下の額とすることができる。」. -/
namespace JapanTaxLaw.LocalTax73_30EvadedAbove500k

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 499999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 500000 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 500001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 499999 = false := by decide  -- bool
example : inScopeBool 500000 = false := by decide  -- bool
example : inScopeBool 500001 = true := by decide  -- bool
example : inScope 500000 ↔ specInScope 500000 := agree_scope 500000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax73_30EvadedAbove500k
