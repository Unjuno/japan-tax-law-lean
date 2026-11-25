import JapanTaxLaw.PercentageSurchargeSpec

/-! Regression tests — 15% / 35% / 20% 割合乗算. -/

namespace JapanTaxLaw.PercentageSurcharge

example : surcharge15 100 = 15 := by decide
example : surcharge15 1000 = 150 := by decide
example : surcharge15 101 = 15 := by decide
example : addition35 100 = 35 := by decide
example : addition35 1000 = 350 := by decide
example : rate20 100 = 20 := by decide
example : surcharge15 100 = specSurcharge15 100 := agree15 100
example : addition35 1000 = specAddition35 1000 := agree35 1000
example : rate20 100 = specRate20 100 := agree20 100
example : surcharge15 100 ≤ surcharge15 200 := monotone15 100 200 (by decide)

end JapanTaxLaw.PercentageSurcharge
