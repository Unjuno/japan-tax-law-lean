import JapanTaxLaw.BuildingArea800

/-- Independent spec for BuildingArea800 (租税特別措置法 art. 70の6の8): strict `¬ 800 < sqm` form. -/

namespace JapanTaxLaw.BuildingArea800Spec

def specBuildingArea (sqm : Nat) : Bool :=
  decide (¬ 800 < sqm)

def agreeBuilding (x : Nat) : Prop :=
  specBuildingArea x = JapanTaxLaw.BuildingArea800.withinBuildingArea x

theorem agree_building (x : Nat) : agreeBuilding x := by
  unfold agreeBuilding specBuildingArea JapanTaxLaw.BuildingArea800.withinBuildingArea
  unfold JapanTaxLaw.BuildingArea800.buildingAreaCap
  simp

end JapanTaxLaw.BuildingArea800Spec
