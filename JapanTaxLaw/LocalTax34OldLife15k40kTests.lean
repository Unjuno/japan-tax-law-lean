import JapanTaxLaw.LocalTax34OldLife15k40kSpec
/- Kernel-decided boundary checks for 「前年中に支払つた旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合」. -/
namespace JapanTaxLaw.LocalTax34OldLife15k40k
open JapanTaxLaw.TaxFinance
example : ¬ inScope 0 := by unfold inScope lower upper; decide
example : ¬ inScope 1 := by unfold inScope lower upper; decide
example : ¬ inScope 14_999 := by unfold inScope lower upper; decide
example : ¬ inScope 15_000 := by unfold inScope lower upper; decide
example : inScope 15_001 := by unfold inScope lower upper; decide
example : inScope 40_000 := by unfold inScope lower upper; decide
example : ¬ inScope 40_001 := by unfold inScope lower upper; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 14_999 = false := by decide
example : inScopeBool 15_000 = false := by decide
example : inScopeBool 15_001 = true := by decide
example : inScopeBool 40_000 = true := by decide
example : inScopeBool 40_001 = false := by decide
example : inScope 15_001 ↔ specInScope 15_001 := agree_scope 15_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax34OldLife15k40k
