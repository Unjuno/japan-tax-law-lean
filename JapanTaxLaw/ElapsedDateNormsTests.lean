import JapanTaxLaw.ElapsedDateNorms
import JapanTaxLaw.ElapsedDateNormsSpec

/-!
# ElapsedDateNormsTests — 経過日・期限
-/
namespace JapanTaxLaw.ElapsedDateNormsTests

open JapanTaxLaw.ElapsedDateNorms

theorem elapsed_spec (s n : Nat) :
    elapsedDate s n = JapanTaxLaw.ElapsedDateNormsSpec.elapsedSpec s n := by rfl

theorem after_spec (d s n : Nat) :
    afterElapsed d s n = true ↔ JapanTaxLaw.ElapsedDateNormsSpec.afterSpec d s n := by
  simp [afterElapsed, JapanTaxLaw.ElapsedDateNormsSpec.afterSpec]

theorem before_day_spec (s n : Nat) :
    dayBefore s n = JapanTaxLaw.ElapsedDateNormsSpec.beforeDaySpec s n := by rfl

theorem deadline_spec (s f l : Nat) :
    withinDeadline s f l = true ↔ JapanTaxLaw.ElapsedDateNormsSpec.deadlineSpec s f l := by
  simp [withinDeadline, JapanTaxLaw.ElapsedDateNormsSpec.deadlineSpec]

example (s : Nat) : elapsedDate s 0 = s := elapsed_zero s
example (s n : Nat) : afterElapsed (s + n) s n = true := after_at_boundary s n
example (s d n : Nat) (h : d < s) : afterElapsed d s n = false := after_far_before s d n h
example (s : Nat) : dayBefore s 1 = s := day_before_n1 s
example (s : Nat) : dayBefore s 5 = s + 4 := day_before_n5 s
example (s l : Nat) : withinDeadline s (s + l) l = true := within_at_limit s l
example : elapsedDeclared = true := elapsed_is_declaration

end JapanTaxLaw.ElapsedDateNormsTests
