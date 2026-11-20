import JapanTaxLaw.InternationalTouristTaxRate

/-!
# InternationalTouristTaxRateTests — kernel-decided smoke checks

No new theorem names; every check is an `example ... := by decide`.
Boundary coverage: 3,000 (原文), 0 / 300 / 30,000 (桁違いの拒否).
-/

namespace JapanTaxLaw.InternationalTouristTaxRate

open JapanTaxLaw.TaxFinance

example : departureTaxRate = 3_000 := by decide
example : departureTaxRate > 0 := by decide
example : departureTaxRate ≠ 0 := by decide
example : departureTaxRate ≠ 300 := by decide
example : departureTaxRate ≠ 30_000 := by decide

end JapanTaxLaw.InternationalTouristTaxRate
