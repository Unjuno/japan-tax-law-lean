import JapanTaxLaw.Income18M05

/-! Independent spec for Income18M05: strict `¬ x <= 18050000` form. -/

namespace JapanTaxLaw.Income18M05Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 18050000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Income18M05.exceedsIncome18M05 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Income18M05.exceedsIncome18M05
  unfold JapanTaxLaw.Income18M05.incomeFloor18M05
  simp

end JapanTaxLaw.Income18M05Spec
