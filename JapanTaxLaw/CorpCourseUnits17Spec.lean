import JapanTaxLaw.CorpCourseUnits17

/-! Independent spec for CorpCourseUnits17: strict `¬ x < 17` form. -/

namespace JapanTaxLaw.CorpCourseUnits17Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 17)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CorpCourseUnits17.hasCorpUnits17 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CorpCourseUnits17.hasCorpUnits17
  unfold JapanTaxLaw.CorpCourseUnits17.corpUnitsFloor17
  simp

end JapanTaxLaw.CorpCourseUnits17Spec
