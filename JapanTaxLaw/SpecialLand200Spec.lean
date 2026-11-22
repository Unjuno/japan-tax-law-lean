import JapanTaxLaw.SpecialLand200

/-! Independent spec for SpecialLand200: strict `¬ 200 < x` form. -/

namespace JapanTaxLaw.SpecialLand200Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 200 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.SpecialLand200.withinSpecialLand200 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.SpecialLand200.withinSpecialLand200
  unfold JapanTaxLaw.SpecialLand200.specialLandCap200
  simp

end JapanTaxLaw.SpecialLand200Spec
