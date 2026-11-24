import JapanTaxLaw.CourseUnits31Spec

/-! Kernel-decided boundary examples: 0/30/31/32 単位. -/

namespace JapanTaxLaw.CourseUnits31Tests

open JapanTaxLaw.CourseUnits31
open JapanTaxLaw.CourseUnits31Spec

example : hasCourseUnits31 0 = false := by decide
example : hasCourseUnits31 30 = false := by decide
example : hasCourseUnits31 31 = true := by decide
example : hasCourseUnits31 32 = true := by decide
example : specWithin 30 = false := by decide
example : specWithin 31 = true := by decide
example : specWithin 32 = true := by decide
example : agree 0 := agree_thm 0
example : agree 30 := agree_thm 30
example : agree 31 := agree_thm 31
example : agree 32 := agree_thm 32

end JapanTaxLaw.CourseUnits31Tests
