import JapanTaxLaw.SpecialLand400

/-! Independent spec for SpecialLand400: strict `¬ 400 < x` form. -/

namespace JapanTaxLaw.SpecialLand400Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 400 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.SpecialLand400.withinSpecialLand400 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.SpecialLand400.withinSpecialLand400
  unfold JapanTaxLaw.SpecialLand400.specialLandCap400
  simp

end JapanTaxLaw.SpecialLand400Spec
