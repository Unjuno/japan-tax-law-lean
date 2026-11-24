import JapanTaxLaw.FlatTaxRatesSpec

/-! Regression tests — 13 定额税率. -/

namespace JapanTaxLaw.FlatTaxRates

example : flatAmount FlatRateKind.individualEqualLow = 1_000 := by decide
example : flatAmount FlatRateKind.individualEqualHigh = 3_000 := by decide
example : flatAmount FlatRateKind.golfCourseUse = 800 := by decide
example : flatAmount FlatRateKind.lightOil = 15_000 := by decide
example : flatAmount FlatRateKind.tobaccoLocal = 6_552 := by decide
example : flatAmount FlatRateKind.localGasoline = 4_400 := by decide
example : flatAmount FlatRateKind.gasoline = 24_300 := by decide
example : flatAmount FlatRateKind.aviationFuel = 26_000 := by decide
example : flatAmount FlatRateKind.powerDevelopment = 375 := by decide
example : flatAmount FlatRateKind.tobaccoNational = 6_802 := by decide
example : flatAmount FlatRateKind.internationalTourist = 3_000 := by decide
example : flatAmount FlatRateKind.forestEnvironment = 1_000 := by decide
example : flatAmount FlatRateKind.fixedAssetLarge = 14 := by decide

example : flatAmount FlatRateKind.lightOil = specFlatAmount FlatRateKind.lightOil :=
  agreeFlatRates _
example : flatAmount FlatRateKind.fixedAssetLarge = specFlatAmount FlatRateKind.fixedAssetLarge :=
  agreeFlatRates _

end JapanTaxLaw.FlatTaxRates
