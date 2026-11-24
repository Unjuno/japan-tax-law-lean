import JapanTaxLaw.UrbanDev2000sqm

/-! Independent spec for UrbanDev2000sqm: strict `¬ x < 2000` form. -/

namespace JapanTaxLaw.UrbanDev2000sqmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 2000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.UrbanDev2000sqm.hasUrbanDev2000 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.UrbanDev2000sqm.hasUrbanDev2000
  unfold JapanTaxLaw.UrbanDev2000sqm.urbanDevFloor2000
  simp

end JapanTaxLaw.UrbanDev2000sqmSpec
