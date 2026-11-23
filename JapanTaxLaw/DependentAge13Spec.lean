import JapanTaxLaw.DependentAge13

/-! Independent spec for DependentAge13: strict `¬ x < 13` form. -/

namespace JapanTaxLaw.DependentAge13Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 13)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.DependentAge13.isDependentAge13 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.DependentAge13.isDependentAge13
  unfold JapanTaxLaw.DependentAge13.ageFloor13
  simp

end JapanTaxLaw.DependentAge13Spec
