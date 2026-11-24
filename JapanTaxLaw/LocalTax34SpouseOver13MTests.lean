import JapanTaxLaw.LocalTax34SpouseOver13MSpec

/- Kernel-decided boundary checks for 「前年の合計所得金額が百三十万円を超える配偶者」. -/
namespace JapanTaxLaw.LocalTax34SpouseOver13M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 1_299_999 := by unfold inScope threshold; decide
example : ¬ inScope 1_300_000 := by unfold inScope threshold; decide
example : inScope 1_300_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 1_299_999 = false := by decide
example : inScopeBool 1_300_000 = false := by decide
example : inScopeBool 1_300_001 = true := by decide
example : inScope 1_300_001 ↔ specInScope 1_300_001 := agree_scope 1_300_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34SpouseOver13M
