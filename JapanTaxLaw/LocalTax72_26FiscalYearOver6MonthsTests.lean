import JapanTaxLaw.LocalTax72_26FiscalYearOver6MonthsSpec

/- Kernel-decided boundary checks for 「事業年度の期間が六月を超える法人等」. -/
namespace JapanTaxLaw.LocalTax72_26FiscalYearOver6Months

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 5 := by unfold inScope threshold; decide
example : ¬ inScope 6 := by unfold inScope threshold; decide
example : inScope 7 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 5 = false := by decide
example : inScopeBool 6 = false := by decide
example : inScopeBool 7 = true := by decide
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_26FiscalYearOver6Months
