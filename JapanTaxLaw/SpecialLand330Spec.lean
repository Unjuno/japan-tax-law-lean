import JapanTaxLaw.SpecialLand330

/-! Independent spec for SpecialLand330: strict `¬ 330 < x` form. -/

namespace JapanTaxLaw.SpecialLand330Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 330 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.SpecialLand330.withinSpecialLand330 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.SpecialLand330.withinSpecialLand330
  unfold JapanTaxLaw.SpecialLand330.specialLandCap330
  simp

end JapanTaxLaw.SpecialLand330Spec
