import JapanTaxLaw.PopulationAge65

/-! Independent spec for PopulationAge65: strict `¬ x < 65` form. -/

namespace JapanTaxLaw.PopulationAge65Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 65)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.PopulationAge65.isAge65OrOver x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.PopulationAge65.isAge65OrOver
  unfold JapanTaxLaw.PopulationAge65.ageFloor65
  simp

end JapanTaxLaw.PopulationAge65Spec
