import JapanTaxLaw.LocalTax34RelativeOver1_2MSpec
/- Kernel-decided boundary checks for 「前年の合計所得金額が百二十万円を超える特定親族」. -/
namespace JapanTaxLaw.LocalTax34RelativeOver1_2M
open JapanTaxLaw.TaxFinance
example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 1_200_000 := by unfold inScope threshold; decide
example : inScope 1_200_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 1_200_000 = false := by decide
example : inScopeBool 1_200_001 = true := by decide
example : inScope 1_200_001 ↔ specInScope 1_200_001 := agree_scope 1_200_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax34RelativeOver1_2M
