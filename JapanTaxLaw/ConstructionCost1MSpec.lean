import JapanTaxLaw.ConstructionCost1M

/-! Independent spec for ConstructionCost1M: strict `¬ x <= 1000000` form. -/

namespace JapanTaxLaw.ConstructionCost1MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 1000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ConstructionCost1M.exceedsCost x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ConstructionCost1M.exceedsCost
  unfold JapanTaxLaw.ConstructionCost1M.costThresholdYen
  simp

end JapanTaxLaw.ConstructionCost1MSpec
