import JapanTaxLaw.ConsumptionTaxRate

/-!
# ConsumptionTaxRate tests — 消費税法 art. 29 smoke checks

Decidable smoke tests for the 消費税法 art. 29 model, pinned to
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- standard rate: 百分の七・八
example : consumptionTax 0 false = 0 := by decide
example : consumptionTax 100_000 false = 7_800 := by decide
example : consumptionTax 1_000_000 false = 78_000 := by decide
example : consumptionTax 5_000_000 false = 390_000 := by decide
example : consumptionTax 10_000_000 false = 780_000 := by decide
example : consumptionTax 12_500_000 false = 975_000 := by decide

-- reduced rate: 百分の六・二四 (for 軽減対象課税資産の譲渡等 etc.)
example : consumptionTax 0 true = 0 := by decide
example : consumptionTax 100_000 true = 6_240 := by decide
example : consumptionTax 1_000_000 true = 62_400 := by decide
example : consumptionTax 5_000_000 true = 312_000 := by decide
example : consumptionTax 10_000_000 true = 624_000 := by decide

-- both rates, composed equivalence
example : consumptionTax 10_000_000 true * 5 = consumptionTax 10_000_000 false * 4 := by decide

end JapanTaxLaw
