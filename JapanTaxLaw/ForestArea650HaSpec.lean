import JapanTaxLaw.ForestArea650Ha

/-! Independent spec for ForestArea650Ha: strict `¬ x <= 650` form. -/

namespace JapanTaxLaw.ForestArea650HaSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 650)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ForestArea650Ha.exceedsForest650 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ForestArea650Ha.exceedsForest650
  unfold JapanTaxLaw.ForestArea650Ha.forestFloor650
  simp

end JapanTaxLaw.ForestArea650HaSpec
