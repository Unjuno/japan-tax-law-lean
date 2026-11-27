import JapanTaxLaw.LocalTax478EvadedAbove1MSpec

/- Kernel-decided boundary checks for 「第一項の免れた税額又は前項の還付を受けた金額が百万円を超える場合には、情状により、当該各項の罰金の額が、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は還付を受けた金額に相当する額以下の額とすることができる。」。 -/
namespace JapanTaxLaw.LocalTax478EvadedAbove1M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 999999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 1000000 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 1000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 999999 = false := by decide  -- bool
example : inScopeBool 1000000 = false := by decide  -- bool
example : inScopeBool 1000001 = true := by decide  -- bool
example : inScope 1000000 ↔ specInScope 1000000 := agree_scope 1000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax478EvadedAbove1M
