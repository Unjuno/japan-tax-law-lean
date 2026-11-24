import JapanTaxLaw.LocalTax34SpouseUpTo1MSpec
/- Kernel-decided boundary checks for 「前年の合計所得金額が百万円以下である配偶者」. -/
namespace JapanTaxLaw.LocalTax34SpouseUpTo1M
open JapanTaxLaw.TaxFinance
example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 1_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 1_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 1_000_000 = true := by decide
example : inScopeBool 1_000_001 = false := by decide
example : inScope 1_000_000 ↔ specInScope 1_000_000 := agree_scope 1_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax34SpouseUpTo1M
