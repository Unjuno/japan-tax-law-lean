import JapanTaxLaw.LocalTax72_25Over3MonthsSpec

/- Kernel-decided boundary checks for 「当該道府県知事が指定する三月を超える月数の期間内」. -/
namespace JapanTaxLaw.LocalTax72_25Over3Months

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 2 := by unfold inScope threshold; decide
example : ¬ inScope 3 := by unfold inScope threshold; decide
example : inScope 4 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = false := by decide
example : inScopeBool 3 = false := by decide
example : inScopeBool 4 = true := by decide
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_25Over3Months
