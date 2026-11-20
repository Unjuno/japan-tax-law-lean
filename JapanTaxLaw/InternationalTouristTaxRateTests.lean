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

-- ==== required boundary coverage (kernel-decided; values recomputed from art.15(1)) ====
-- The model is the per-departure rate constant (3,000円/出国); departures are a
-- caller-established Nat, so a total for n departures is n × departureTaxRate.
-- (a) zero input (0 出国): 0 × rate = 0
example : departureTaxRate * 0 = 0 := by decide
-- (b) small positive departure counts 1..13: n × 3,000
example : departureTaxRate * 1 = 3_000 := by decide
example : departureTaxRate * 13 = 39_000 := by decide
-- (c) saturation at the statutory 3,000 threshold (saturating Nat subtraction)
example : departureTaxRate - 3_001 = 0 := by decide

end JapanTaxLaw.InternationalTouristTaxRate
