import JapanTaxLaw.PopulationAge75

/-! Independent spec for PopulationAge75: strict `¬ x < 75` form. -/

namespace JapanTaxLaw.PopulationAge75Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 75)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.PopulationAge75.isAge75OrOver x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.PopulationAge75.isAge75OrOver
  unfold JapanTaxLaw.PopulationAge75.ageFloor75
  simp

end JapanTaxLaw.PopulationAge75Spec
