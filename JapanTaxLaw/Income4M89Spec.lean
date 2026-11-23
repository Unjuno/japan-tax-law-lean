import JapanTaxLaw.Income4M89

/-! Independent spec for Income4M89: strict `¬ x <= 4890000` form. -/

namespace JapanTaxLaw.Income4M89Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 4890000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Income4M89.exceedsIncome4M89 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Income4M89.exceedsIncome4M89
  unfold JapanTaxLaw.Income4M89.incomeFloor4M89
  simp

end JapanTaxLaw.Income4M89Spec
