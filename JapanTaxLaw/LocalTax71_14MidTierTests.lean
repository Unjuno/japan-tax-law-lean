import JapanTaxLaw.LocalTax71_14MidTierSpec

/-
# LocalTax71_14MidTierTests — kernel-decided boundary checks, 「五十万円を超え三百万円以下の部分に相当する金額」
-/

namespace JapanTaxLaw.LocalTax71_14MidTier

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower upper; decide
example : ¬ inScope 1 := by unfold inScope lower upper; decide
example : ¬ inScope 499_999 := by unfold inScope lower upper; decide
example : ¬ inScope 500_000 := by unfold inScope lower upper; decide
example : inScope 500_001 := by unfold inScope lower upper; decide
example : inScope 3_000_000 := by unfold inScope lower upper; decide
example : ¬ inScope 3_000_001 := by unfold inScope lower upper; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 499_999 = false := by decide
example : inScopeBool 500_000 = false := by decide
example : inScopeBool 500_001 = true := by decide
example : inScopeBool 3_000_000 = true := by decide
example : inScopeBool 3_000_001 = false := by decide
example : inScope 500_001 ↔ specInScope 500_001 := agree_scope 500_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax71_14MidTier
