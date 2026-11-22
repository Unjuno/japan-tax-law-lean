import JapanTaxLaw.Employee300Spec

/-! Kernel-decided boundary examples: 0/299/300/301 人. -/

namespace JapanTaxLaw.Employee300Tests

open JapanTaxLaw.Employee300
open JapanTaxLaw.Employee300Spec

example : exceedsEmployees300 0 = false := by decide
example : exceedsEmployees300 299 = false := by decide
example : exceedsEmployees300 300 = false := by decide
example : exceedsEmployees300 301 = true := by decide
example : specWithin 299 = false := by decide
example : specWithin 300 = false := by decide
example : specWithin 301 = true := by decide
example : agree 0 := agree_thm 0
example : agree 299 := agree_thm 299
example : agree 300 := agree_thm 300
example : agree 301 := agree_thm 301

end JapanTaxLaw.Employee300Tests
