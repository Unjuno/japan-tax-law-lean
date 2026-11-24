import JapanTaxLaw.LocalTax72_21Band100B500BSpec

/- Kernel-decided boundary checks for 「千億円を超え五千億円以下の金額」. -/
namespace JapanTaxLaw.LocalTax72_21Band100B500B

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower upper; decide
example : ¬ inScope 1 := by unfold inScope lower upper; decide
example : ¬ inScope 99_999_999_999 := by unfold inScope lower upper; decide
example : ¬ inScope 100_000_000_000 := by unfold inScope lower upper; decide
example : inScope 100_000_000_001 := by unfold inScope lower upper; decide
example : inScope 500_000_000_000 := by unfold inScope lower upper; decide
example : ¬ inScope 500_000_000_001 := by unfold inScope lower upper; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 99_999_999_999 = false := by decide
example : inScopeBool 100_000_000_000 = false := by decide
example : inScopeBool 100_000_000_001 = true := by decide
example : inScopeBool 500_000_000_000 = true := by decide
example : inScopeBool 500_000_000_001 = false := by decide
example : inScope 100_000_000_001 ↔ specInScope 100_000_000_001 := agree_scope 100_000_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_21Band100B500B
