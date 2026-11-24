import JapanTaxLaw.LocalSeismic120sqm

/-! Independent spec for LocalSeismic120sqm: strict `¬ x <= 120` form. -/

namespace JapanTaxLaw.LocalSeismic120sqmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 120)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LocalSeismic120sqm.exceedsSeismic120 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LocalSeismic120sqm.exceedsSeismic120
  unfold JapanTaxLaw.LocalSeismic120sqm.seismicFloor120
  simp

end JapanTaxLaw.LocalSeismic120sqmSpec
