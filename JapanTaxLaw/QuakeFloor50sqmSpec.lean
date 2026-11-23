import JapanTaxLaw.QuakeFloor50sqm

/-! Independent spec for QuakeFloor50sqm: strict `¬ x < 50` form. -/

namespace JapanTaxLaw.QuakeFloor50sqmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 50)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.QuakeFloor50sqm.hasFloor50 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.QuakeFloor50sqm.hasFloor50
  unfold JapanTaxLaw.QuakeFloor50sqm.floorMin50
  simp

end JapanTaxLaw.QuakeFloor50sqmSpec
