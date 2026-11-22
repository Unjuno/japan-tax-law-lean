import JapanTaxLaw.LandArea400

/-- Independent spec for LandArea400 (租税特別措置法 art. 70の6の8): strict `¬ 400 < sqm` form. -/

namespace JapanTaxLaw.LandArea400Spec

def specLandArea (sqm : Nat) : Bool :=
  decide (¬ 400 < sqm)

def agreeLand (x : Nat) : Prop :=
  specLandArea x = JapanTaxLaw.LandArea400.withinLandArea x

theorem agree_land (x : Nat) : agreeLand x := by
  unfold agreeLand specLandArea JapanTaxLaw.LandArea400.withinLandArea
  unfold JapanTaxLaw.LandArea400.landAreaCap
  simp

end JapanTaxLaw.LandArea400Spec
