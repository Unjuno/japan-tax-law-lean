import JapanTaxLaw.LightMotorVehicleTaxShortfallSurcharge35

/-!
# LightMotorVehicleTaxShortfallSurcharge35 tests — 35% の境界検査
Pinned to law 325AC0000000226 / art. 30の2. zero / small / below / at / above 三十五.
-/

namespace JapanTaxLaw.LightMotorVehicleTaxShortfallSurcharge35

example : shortfallSurcharge 0 = 0 := by decide
example : shortfallSurcharge 1 = 0 := by decide
example : shortfallSurcharge 34 = 11 := by decide
example : shortfallSurcharge 35 = 12 := by decide
example : shortfallSurcharge 36 = 12 := by decide
example : shortfallSurcharge 99 = 34 := by decide
example : shortfallSurcharge 100 = 35 := by decide
example : shortfallSurcharge 101 = 35 := by decide

end JapanTaxLaw.LightMotorVehicleTaxShortfallSurcharge35
