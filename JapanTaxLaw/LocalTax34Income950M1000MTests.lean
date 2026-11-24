import JapanTaxLaw.LocalTax34Income950M1000MSpec
/- Kernel-decided boundary checks for 「当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合」. -/
namespace JapanTaxLaw.LocalTax34Income950M1000M
open JapanTaxLaw.TaxFinance
example : ¬ inScope 0 := by unfold inScope lower upper; decide
example : ¬ inScope 1 := by unfold inScope lower upper; decide
example : ¬ inScope 9_499_999 := by unfold inScope lower upper; decide
example : ¬ inScope 9_500_000 := by unfold inScope lower upper; decide
example : inScope 9_500_001 := by unfold inScope lower upper; decide
example : inScope 10_000_000 := by unfold inScope lower upper; decide
example : ¬ inScope 10_000_001 := by unfold inScope lower upper; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 9_499_999 = false := by decide
example : inScopeBool 9_500_000 = false := by decide
example : inScopeBool 9_500_001 = true := by decide
example : inScopeBool 10_000_000 = true := by decide
example : inScopeBool 10_000_001 = false := by decide
example : inScope 9_500_001 ↔ specInScope 9_500_001 := agree_scope 9_500_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax34Income950M1000M
