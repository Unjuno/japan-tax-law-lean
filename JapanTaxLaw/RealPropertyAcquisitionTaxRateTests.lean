import JapanTaxLaw.RealPropertyAcquisitionTaxRate

/-!
# RealPropertyAcquisitionTaxRate tests — 不動産取得税 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
税率4%: 1000→40, 10000→400。
-/

namespace JapanTaxLaw.RealPropertyAcquisitionTaxRate

example : standardRatePercent = 4 := by decide
example : taxYen 0 = 0 := by decide
example : taxYen 1000 = 40 := by decide
example : taxYen 10000 = 400 := by decide

end JapanTaxLaw.RealPropertyAcquisitionTaxRate
