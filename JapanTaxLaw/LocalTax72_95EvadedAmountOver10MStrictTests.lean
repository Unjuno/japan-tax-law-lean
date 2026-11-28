import JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrictSpec

/- Kernel-decided boundary checks for 「第一項第一号の免れた税額若しくは同項第二号の還付を受けた金額又は前項の犯罪に係る還付を受けようとした金額が千万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、千万円を超える額でその免れた税額若しくは還付を受けた金額又は還付を受けようとした金額に相当する額以下の額とすることができる。」. -/
namespace JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 9_999_999 = false := by decide  -- threshold_below
example : inScopeBool 10_000_000 = false := by decide  -- threshold_at (exclusive)
example : inScopeBool 10_000_001 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : ¬ inScope 10_000_000 := by unfold inScope; decide  -- threshold_at (exclusive, Prop)
example : inScope 10_000_001 := by unfold inScope; decide  -- outside (Prop, above)
example : inScope 10_000_001 ↔ specInScope 10_000_001 := agree_scope 10_000_001
example (yen : Nat) : inScope yen ↔ specInScope yen := agree_scope yen

end JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict
