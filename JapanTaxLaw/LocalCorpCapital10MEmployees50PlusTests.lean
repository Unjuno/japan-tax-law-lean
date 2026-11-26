import JapanTaxLaw.LocalCorpCapital10MEmployees50PlusSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LocalCorpCapital10MEmployees50PlusTests

open JapanTaxLaw.LocalCorpCapital10MEmployees50Plus
open JapanTaxLaw.LocalCorpCapital10MEmployees50PlusSpec

example : qualified 0 0 = false := by decide
example : qualified 10000000 50 = false := by decide
example : qualified 10000000 51 = true := by decide
example : qualified 9999999 51 = true := by decide
example : qualified 10000001 50 = false := by decide
example : qualified 1 1 = false := by decide
example : agree 0 0 := agree_thm 0 0
example : agree 10000000 50 := agree_thm 10000000 50
example : agree 10000000 51 := agree_thm 10000000 51
example : agree 9999999 51 := agree_thm 9999999 51

end JapanTaxLaw.LocalCorpCapital10MEmployees50PlusTests
