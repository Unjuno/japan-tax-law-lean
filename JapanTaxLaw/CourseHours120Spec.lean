import JapanTaxLaw.CourseHours120

/-! Independent spec for CourseHours120: strict `¬ x < 120` form. -/

namespace JapanTaxLaw.CourseHours120Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 120)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CourseHours120.hasCourse120 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CourseHours120.hasCourse120
  unfold JapanTaxLaw.CourseHours120.courseFloor120
  simp

end JapanTaxLaw.CourseHours120Spec
