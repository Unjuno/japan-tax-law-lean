import JapanTaxLaw.LocalTax72_2_2ThreePrefecturesSpec

/- Kernel-decided boundary checks for 「三以上の道府県において事務所又は事業所を設けて事業を行う固有法人で」. -/
namespace JapanTaxLaw.LocalTax72_2_2ThreePrefectures

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScope 4 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = false := by decide
example : inScopeBool 3 = true := by decide
example : inScopeBool 4 = true := by decide
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_2_2ThreePrefectures
