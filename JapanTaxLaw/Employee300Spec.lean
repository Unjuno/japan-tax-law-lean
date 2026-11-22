import JapanTaxLaw.Employee300

/-! Independent spec for Employee300: strict `¬ x <= 300` form. -/

namespace JapanTaxLaw.Employee300Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 300)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Employee300.exceedsEmployees300 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Employee300.exceedsEmployees300
  unfold JapanTaxLaw.Employee300.employeeFloor300
  simp

end JapanTaxLaw.Employee300Spec
