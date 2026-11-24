import JapanTaxLaw.LocalTax34Age16PlusSpec
/- Kernel-decided boundary checks for 「年齢十六歳以上の者」. -/
namespace JapanTaxLaw.LocalTax34Age16Plus
open JapanTaxLaw.TaxFinance
example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 15 := by unfold inScope threshold; decide
example : inScope 16 := by unfold inScope threshold; decide
example : inScope 17 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 15 = false := by decide
example : inScopeBool 16 = true := by decide
example : inScopeBool 17 = true := by decide
example : inScope 16 ↔ specInScope 16 := agree_scope 16
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax34Age16Plus
