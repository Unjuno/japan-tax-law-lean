import JapanTaxLaw.LocalCorpCapital10M100MEmployees50Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LocalCorpCapital10M100MEmployees50Tests

open JapanTaxLaw.LocalCorpCapital10M100MEmployees50
open JapanTaxLaw.LocalCorpCapital10M100MEmployees50Spec

example : qualified 9999999 50 = false := by decide
example : qualified 10000000 50 = false := by decide
example : qualified 10000001 50 = true := by decide
example : qualified 100000000 50 = true := by decide
example : qualified 100000001 50 = false := by decide
example : qualified 10000001 51 = false := by decide
example : qualified 1 1 = false := by decide
example : agree 9999999 50 := agree_thm 9999999 50
example : agree 10000000 50 := agree_thm 10000000 50
example : agree 10000001 50 := agree_thm 10000001 50
example : agree 100000000 50 := agree_thm 100000000 50

end JapanTaxLaw.LocalCorpCapital10M100MEmployees50Tests
