import JapanTaxLaw.PowerDevelopmentTaxRate

/-!
# PowerDevelopmentTaxRate tests — 電源開発促進税 smoke checks
Decidable smoke tests, pinned to law 349AC0000000079 / revision 349AC0000000079_20250601_504AC0000000068.
税率 375 円/千kWh、数量 0/1/100。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxRate

example : ratePerThousandKWh = 375 := by decide
example : taxYen 0 = 0 := by decide
example : taxYen 1 = 375 := by decide
example : taxYen 2 = 750 := by decide
example : taxYen 100 = 37_500 := by decide

end JapanTaxLaw.PowerDevelopmentTaxRate
