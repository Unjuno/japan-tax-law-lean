import JapanTaxLaw.LocalTax34SpouseBand1M13MSpec

/- Kernel-decided boundary checks for 「前年の合計所得金額が百万円を超え百三十万円以下である配偶者」. -/
namespace JapanTaxLaw.LocalTax34SpouseBand1M13M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower upper; decide
example : ¬ inScope 1 := by unfold inScope lower upper; decide
example : ¬ inScope 999_999 := by unfold inScope lower upper; decide
example : ¬ inScope 1_000_000 := by unfold inScope lower upper; decide
example : inScope 1_000_001 := by unfold inScope lower upper; decide
example : inScope 1_300_000 := by unfold inScope lower upper; decide
example : ¬ inScope 1_300_001 := by unfold inScope lower upper; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 999_999 = false := by decide
example : inScopeBool 1_000_000 = false := by decide
example : inScopeBool 1_000_001 = true := by decide
example : inScopeBool 1_300_000 = true := by decide
example : inScopeBool 1_300_001 = false := by decide
example : inScope 1_000_001 ↔ specInScope 1_000_001 := agree_scope 1_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34SpouseBand1M13M
