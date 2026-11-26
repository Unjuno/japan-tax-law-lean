import JapanTaxLaw.LocalTax9_2Band4MTo1BSpec

/- Kernel-decided boundary checks for 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」. -/
namespace JapanTaxLaw.LocalTax9_2Band4MTo1B

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower upper; decide  -- zero
example : ¬ inScope 1 := by unfold inScope lower upper; decide  -- small_input
example : ¬ inScope 3_999_999 := by unfold inScope lower upper; decide  -- below_lower
example : ¬ inScope 4_000_000 := by unfold inScope lower upper; decide  -- at_lower (を超え strict)
example : inScope 4_000_001 := by unfold inScope lower upper; decide  -- above_lower
example : inScope 1_000_000_000 := by unfold inScope lower upper; decide  -- at_upper (以下 inclusive)
example : ¬ inScope 1_000_000_001 := by unfold inScope lower upper; decide  -- above_upper
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 3_999_999 = false := by decide
example : inScopeBool 4_000_000 = false := by decide
example : inScopeBool 4_000_001 = true := by decide
example : inScopeBool 1_000_000_000 = true := by decide
example : inScopeBool 1_000_000_001 = false := by decide
example : inScope 4_000_000 ↔ specInScope 4_000_000 := agree_scope 4_000_000
example : inScope 1_000_000_000 ↔ specInScope 1_000_000_000 := agree_scope 1_000_000_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax9_2Band4MTo1B
