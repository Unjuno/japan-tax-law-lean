import JapanTaxLaw.SparklingAlcohol11Spec

/-! Kernel-decided boundary examples: 0/10/11/12 度. -/

namespace JapanTaxLaw.SparklingAlcohol11Tests

open JapanTaxLaw.SparklingAlcohol11
open JapanTaxLaw.SparklingAlcohol11Spec

example : isSparklingUnder11 0 = true := by decide
example : isSparklingUnder11 10 = true := by decide
example : isSparklingUnder11 11 = false := by decide
example : isSparklingUnder11 12 = false := by decide
example : specWithin 10 = true := by decide
example : specWithin 11 = false := by decide
example : specWithin 12 = false := by decide
example : agree 0 := agree_thm 0
example : agree 10 := agree_thm 10
example : agree 11 := agree_thm 11
example : agree 12 := agree_thm 12

end JapanTaxLaw.SparklingAlcohol11Tests
