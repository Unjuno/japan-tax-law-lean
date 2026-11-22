import JapanTaxLaw.TaxService15YearsSpec

/-! Kernel-decided boundary examples: 0/14/15/16 年. -/

namespace JapanTaxLaw.TaxService15YearsTests

open JapanTaxLaw.TaxService15Years
open JapanTaxLaw.TaxService15YearsSpec

example : has15Years 0 = false := by decide
example : has15Years 14 = false := by decide
example : has15Years 15 = true := by decide
example : has15Years 16 = true := by decide
example : specWithin 14 = false := by decide
example : specWithin 15 = true := by decide
example : specWithin 16 = true := by decide
example : agree 0 := agree_thm 0
example : agree 14 := agree_thm 14
example : agree 15 := agree_thm 15
example : agree 16 := agree_thm 16

end JapanTaxLaw.TaxService15YearsTests
