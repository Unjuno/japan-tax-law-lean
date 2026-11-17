import JapanTaxLaw.CorporateGlobeRates

/-!
# CorporateGlobeRates tests — 法人税法 art. 82の13 / art. 82の21 / art. 145の8 smoke checks

Decidable kernel smoke tests, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準額 is caller-established; no Bool enters any formula.
Rounding is floor (切り捨て) via TaxRate.applyFloor.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 82の13: 課税標準国際最低課税残余額 × 907/1000 (百分の九十・七, floor)
example : internationalMinimumResidualTax 0 = 0 := by decide
example : internationalMinimumResidualTax 1 = 0 := by decide
example : internationalMinimumResidualTax 999 = 906 := by decide
example : internationalMinimumResidualTax 1000 = 907 := by decide
example : internationalMinimumResidualTax 100_000 = 90_700 := by decide
example : internationalMinimumResidualTax 1_000_000 = 907_000 := by decide

-- art. 82の21: 課税標準国内最低課税額 × 753/1000 (百分の七十五・三, floor)
example : domesticMinimumTax 0 = 0 := by decide
example : domesticMinimumTax 1 = 0 := by decide
example : domesticMinimumTax 999 = 752 := by decide
example : domesticMinimumTax 1000 = 753 := by decide
example : domesticMinimumTax 100_000 = 75_300 := by decide
example : domesticMinimumTax 1_000_000 = 753_000 := by decide

-- art. 145の8: 外国法人 課税標準国内最低課税額 × 753/1000 (百分の七十五・三, floor)
example : foreignDomesticMinimumTax 0 = 0 := by decide
example : foreignDomesticMinimumTax 1 = 0 := by decide
example : foreignDomesticMinimumTax 999 = 752 := by decide
example : foreignDomesticMinimumTax 1000 = 753 := by decide
example : foreignDomesticMinimumTax 100_000 = 75_300 := by decide
example : foreignDomesticMinimumTax 1_000_000 = 753_000 := by decide

end JapanTaxLaw
