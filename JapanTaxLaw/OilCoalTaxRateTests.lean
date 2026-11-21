import JapanTaxLaw.OilCoalTaxRate

/-!
# OilCoalTaxRate tests — 石油石炭税法 art.9 smoke checks
Decidable smoke tests, pinned to law 353AC0000000025 / revision 353AC0000000025_20260525_506AC0000000052.
税率 2040/1080/700、数量 0/1/2/3。
-/

namespace JapanTaxLaw.OilCoalTaxRate

example : crudeOilRatePerKL = 2_040 := by decide
example : gaseousHCRatePerTon = 1_080 := by decide
example : coalRatePerTon = 700 := by decide
example : crudeOilTax 0 = 0 := by decide
example : crudeOilTax 1 = 2_040 := by decide
example : gaseousHCTax 2 = 2_160 := by decide
example : coalTax 3 = 2_100 := by decide

end JapanTaxLaw.OilCoalTaxRate
