import JapanTaxLaw.CustomsStorageFee

/-!
# CustomsStorageFee tests — 関税法施行令 art.70の3 smoke checks
Decidable smoke tests, pinned to law 329CO0000000150 / revision 329CO0000000150_20260701_508CO0000000217.
境界: 一トン未満切り上げ、端数0、日数0、180円の桁。有限領域の smoke。
-/

namespace JapanTaxLaw.CustomsStorageFee

example : unitRate = 180 := by decide
example : chargeableUnits 0 0 = 0 := by decide
example : chargeableUnits 0 1 = 1 := by decide
example : chargeableUnits 10 0 = 10 := by decide
example : chargeableUnits 10 1 = 11 := by decide
example : storageFee 1 1 0 = 180 := by decide
example : storageFee 1 1 1 = 360 := by decide
example : storageFee 3 2 0 = 1080 := by decide
example : storageFee 0 5 3 = 0 := by decide
example : storageFee 7 10 5 = 13860 := by decide

end JapanTaxLaw.CustomsStorageFee
