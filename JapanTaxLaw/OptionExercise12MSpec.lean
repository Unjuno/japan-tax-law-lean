import JapanTaxLaw.OptionExercise12M

/-! Independent spec for OptionExercise12M: strict `¬ 12000000 < x` form. -/

namespace JapanTaxLaw.OptionExercise12MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 12000000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OptionExercise12M.withinExerciseTotal x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OptionExercise12M.withinExerciseTotal
  unfold JapanTaxLaw.OptionExercise12M.exerciseCapYen
  simp

end JapanTaxLaw.OptionExercise12MSpec
