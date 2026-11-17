import JapanTaxLaw.CorporateMiscRates

/-!
# CorporateMiscRates tests — 法人税法 art. 87 / art. 82の5 / art. 145の12 smoke checks

Decidable kernel smoke tests, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準額 is caller-established; no Bool enters any formula.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 87: 退職年金等積立金 × 1/100 (floor)
example : retirementPensionReserveTax 0 = 0 := by decide
example : retirementPensionReserveTax 1 = 0 := by decide
example : retirementPensionReserveTax 99 = 0 := by decide
example : retirementPensionReserveTax 100 = 1 := by decide
example : retirementPensionReserveTax 12345 = 123 := by decide
example : retirementPensionReserveTax 1_000_000 = 10_000 := by decide

-- art. 82の5: 課税標準国際最低課税額 × 907/1000 (百分の九十・七, floor)
example : internationalMinimumTax 0 = 0 := by decide
example : internationalMinimumTax 1 = 0 := by decide
example : internationalMinimumTax 999 = 906 := by decide
example : internationalMinimumTax 1000 = 907 := by decide
example : internationalMinimumTax 100_000 = 90_700 := by decide
example : internationalMinimumTax 1_000_000 = 907_000 := by decide

-- art. 145の12: 外国法人退職年金積立金 × 1/100 (floor)
example : foreignPensionReserveTax 0 = 0 := by decide
example : foreignPensionReserveTax 1 = 0 := by decide
example : foreignPensionReserveTax 100 = 1 := by decide
example : foreignPensionReserveTax 12345 = 123 := by decide
example : foreignPensionReserveTax 1_000_000 = 10_000 := by decide

end JapanTaxLaw
