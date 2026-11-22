import JapanTaxLaw.BuildingArea800Spec

/-! Kernel-decided boundary examples for BuildingArea800 (0/799/800/801 m²). -/

namespace JapanTaxLaw.BuildingArea800Tests

open JapanTaxLaw.BuildingArea800
open JapanTaxLaw.BuildingArea800Spec

example : withinBuildingArea 0 = true := by decide
example : withinBuildingArea 799 = true := by decide
example : withinBuildingArea 800 = true := by decide
example : withinBuildingArea 801 = false := by decide
example : specBuildingArea 799 = true := by decide
example : specBuildingArea 800 = true := by decide
example : specBuildingArea 801 = false := by decide
example : agreeBuilding 0 := agree_building 0
example : agreeBuilding 799 := agree_building 799
example : agreeBuilding 800 := agree_building 800
example : agreeBuilding 801 := agree_building 801

end JapanTaxLaw.BuildingArea800Tests
