import JapanTaxLaw.BuildingSite150sqm

/-! Independent spec for BuildingSite150sqm: strict `¬ x < 150` form. -/

namespace JapanTaxLaw.BuildingSite150sqmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 150)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.BuildingSite150sqm.hasSite150 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.BuildingSite150sqm.hasSite150
  unfold JapanTaxLaw.BuildingSite150sqm.siteFloor150
  simp

end JapanTaxLaw.BuildingSite150sqmSpec
