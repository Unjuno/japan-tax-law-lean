import JapanTaxLaw.TariffSpecificFloorSpec

/-! Regression tests — specific-duty floor boundaries and universal agreement. -/

namespace JapanTaxLaw.TariffSpecificFloor

example : tariffDuty 0 7 28 1000 20 = 140 := by decide
example : tariffDuty 714 1 28 1000 20 = 20 := by decide
example : tariffDuty 1_000 1 28 1000 20 = 28 := by decide
example : tariffDuty 100 500 50 100 25 = 25_000 := by decide

example : tariffDuty 123 7 28 1000 20 = specTariffDuty 123 7 28 1000 20 :=
  tariffDuty_agrees 123 7 28 1000 20 (by decide)
example : tariffDuty 9_999 7 35 100 27 = specTariffDuty 9_999 7 35 100 27 :=
  tariffDuty_agrees 9_999 7 35 100 27 (by decide)

end JapanTaxLaw.TariffSpecificFloor
