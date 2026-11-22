import JapanTaxLaw.PopulationAge18

/-! Independent spec for PopulationAge18: strict `¬ 18 < x` form. -/

namespace JapanTaxLaw.PopulationAge18Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 18 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.PopulationAge18.withinAge18 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.PopulationAge18.withinAge18
  unfold JapanTaxLaw.PopulationAge18.ageCeiling
  simp

end JapanTaxLaw.PopulationAge18Spec
