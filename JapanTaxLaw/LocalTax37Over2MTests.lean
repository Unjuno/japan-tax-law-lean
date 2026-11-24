import JapanTaxLaw.LocalTax37Over2MSpec

/- Kernel-decided boundary checks for 「二百万円を超える場合」. -/
namespace JapanTaxLaw.LocalTax37Over2M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 1_999_999 := by unfold inScope threshold; decide
example : ¬ inScope 2_000_000 := by unfold inScope threshold; decide
example : inScope 2_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 1_999_999 = false := by decide
example : inScopeBool 2_000_000 = false := by decide
example : inScopeBool 2_000_001 = true := by decide
example : inScope 2_000_001 ↔ specInScope 2_000_001 := agree_scope 2_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax37Over2M
