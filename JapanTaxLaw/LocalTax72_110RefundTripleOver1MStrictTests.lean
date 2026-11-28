import JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrictSpec

/- Kernel-decided boundary checks for 「前項の還付を受けた金額の三倍が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超え当該相当額の三倍以下の額とすることができる。」. -/
namespace JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 999_999 = false := by decide  -- threshold_below
example : inScopeBool 1_000_000 = false := by decide  -- threshold_at (exclusive)
example : inScopeBool 1_000_001 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : ¬ inScope 1_000_000 := by unfold inScope; decide  -- threshold_at (exclusive, Prop)
example : inScope 1_000_001 := by unfold inScope; decide  -- outside (Prop, above)
example : inScope 1_000_001 ↔ specInScope 1_000_001 := agree_scope 1_000_001
example (yen : Nat) : inScope yen ↔ specInScope yen := agree_scope yen

end JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict
