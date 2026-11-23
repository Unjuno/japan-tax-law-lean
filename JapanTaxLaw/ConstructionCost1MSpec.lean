import JapanTaxLaw.ConstructionCost1M

/-! Independent spec for ConstructionCost1M: strict `¬ x <= 1000000` form. -/

namespace JapanTaxLaw.ConstructionCost1MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 1000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ConstructionCost1M.exceedsConstruction1M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ConstructionCost1M.exceedsConstruction1M
  unfold JapanTaxLaw.ConstructionCost1M.constructionFloor1M
  simp

end JapanTaxLaw.ConstructionCost1MSpec
