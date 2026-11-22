import JapanTaxLaw.OptionExercise12MSpec

/-! Kernel-decided boundary examples: 0/11999999/12000000/12000001 円. -/

namespace JapanTaxLaw.OptionExercise12MTests

open JapanTaxLaw.OptionExercise12M
open JapanTaxLaw.OptionExercise12MSpec

example : withinExerciseTotal 0 = true := by decide
example : withinExerciseTotal 11999999 = true := by decide
example : withinExerciseTotal 12000000 = true := by decide
example : withinExerciseTotal 12000001 = false := by decide
example : specWithin 11999999 = true := by decide
example : specWithin 12000000 = true := by decide
example : specWithin 12000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 11999999 := agree_thm 11999999
example : agree 12000000 := agree_thm 12000000
example : agree 12000001 := agree_thm 12000001

end JapanTaxLaw.OptionExercise12MTests
