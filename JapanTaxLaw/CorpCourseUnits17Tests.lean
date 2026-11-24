import JapanTaxLaw.CorpCourseUnits17Spec

/-! Kernel-decided boundary examples: 0/16/17/18 単位. -/

namespace JapanTaxLaw.CorpCourseUnits17Tests

open JapanTaxLaw.CorpCourseUnits17
open JapanTaxLaw.CorpCourseUnits17Spec

example : hasCorpUnits17 0 = false := by decide
example : hasCorpUnits17 16 = false := by decide
example : hasCorpUnits17 17 = true := by decide
example : hasCorpUnits17 18 = true := by decide
example : specWithin 16 = false := by decide
example : specWithin 17 = true := by decide
example : specWithin 18 = true := by decide
example : agree 0 := agree_thm 0
example : agree 16 := agree_thm 16
example : agree 17 := agree_thm 17
example : agree 18 := agree_thm 18

end JapanTaxLaw.CorpCourseUnits17Tests
