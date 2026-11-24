import JapanTaxLaw.CourseUnits31

/-! Independent spec for CourseUnits31: strict `¬ x < 31` form. -/

namespace JapanTaxLaw.CourseUnits31Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 31)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CourseUnits31.hasCourseUnits31 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CourseUnits31.hasCourseUnits31
  unfold JapanTaxLaw.CourseUnits31.unitsFloor31
  simp

end JapanTaxLaw.CourseUnits31Spec
