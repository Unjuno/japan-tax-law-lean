import JapanTaxLaw.VehicleWeightUnitSpec

/-! Kernel-decided boundary examples for 自動車重量税法 art. 7. -/

namespace JapanTaxLaw.VehicleWeightUnitTests

open JapanTaxLaw.VehicleWeightUnit
open JapanTaxLaw.VehicleWeightUnitSpec

example : weightUnits 0 = 0 := by decide
example : weightUnits 1 = 1 := by decide
example : weightUnits 5 = 1 := by decide
example : weightUnits 6 = 2 := by decide
example : weightUnits 11 = 3 := by decide
example : specWeightUnits 5 = 1 := by decide
example : specWeightUnits 6 = 2 := by decide
example : specWeightUnits 11 = 3 := by decide
example : agreeWeightUnits 0 := agree_weight_units 0
example : agreeWeightUnits 5 := agree_weight_units 5
example : agreeWeightUnits 6 := agree_weight_units 6
example : agreeWeightUnits 11 := agree_weight_units 11

end JapanTaxLaw.VehicleWeightUnitTests
